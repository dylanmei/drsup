using System;
using System.Data;
using System.Data.SqlClient;

namespace drsup
{
	class SqlProcessor
	{
		public string Server { get; set; }
		public string Catalog { get; set; }
		public string User { get; set; }
		public string Password { get; set; }
		bool has_version_schema;
		bool has_raised_exception;

		SqlConnection NewConnection
		{
			get { return new SqlConnection(GetConnectionString()); }
		}

		ScriptRunner NewRunner
		{
			get
			{
				return new ScriptRunner {
					Server = Server,
					Catalog = Catalog,
					User = User,
					Password = Password,
					Trusted = string.IsNullOrEmpty(User)
				};
			}
		}

		public string TryConnect()
		{
			string return_value = null;
			var connection = NewConnection;

			try
			{
				connection.Open();
				CheckVersionSchema(connection);
			}
			catch (Exception e)
			{
				return_value = e.Message; 
			}
			finally
			{
				connection.Dispose();
			}

			return return_value;
		}

		public int GetVersion()
		{
			using (var connection = NewConnection)
			{
				connection.Open();
				if (!has_version_schema)
				{
					CreateVersionSchema(connection);
					return 0;
				}

				var command = connection.CreateCommand();
				command.CommandText = "select max(value) from [dbo].[schema-version]";
				var scalar = command.ExecuteScalar();
				return DBNull.Value == scalar ? 0 : Convert.ToInt32(scalar);
			}
		}

		static void SetVersion(SqlConnection connection, int version)
		{
			var command = connection.CreateCommand();
			command.CommandText = "insert into [dbo].[schema-version] values (@version, @when)";
			command.Parameters.Add("@version", SqlDbType.Int).Value = version;
			command.Parameters.Add("@when", SqlDbType.DateTime).Value = DateTime.Now;
			command.ExecuteNonQuery();
		}

		public void RunScript(Script script)
		{
			if (has_raised_exception) return;

			try
			{
				NewRunner.Run(script);
			}
			catch (Exception e)
			{
				has_raised_exception = true;
				Console.WriteLine(e.Message);
				return;
			}

			using (var connection = NewConnection)
			{
				connection.Open();
				SetVersion(connection, script.Version);
			}
		}

		void CheckVersionSchema(SqlConnection connection)
		{
			var command = connection.CreateCommand();
			command.CommandText = "select 1 from dbo.sysobjects where " +
				"id = object_id(N'[dbo].[schema-version]') and OBJECTPROPERTY(id, N'IsUserTable') = 1";
			var scalar = command.ExecuteScalar();
			has_version_schema = scalar != null;
		}

		static void CreateVersionSchema(SqlConnection connection)
		{
			var command = connection.CreateCommand();
			command.CommandText = "create table [dbo].[schema-version]([value][int] not null, [when][datetime] not null) on [primary];" +
				"insert into [dbo].[schema-version] values (0, @when)";
			command.Parameters.Add("@when", SqlDbType.DateTime).Value = DateTime.Now;
			command.ExecuteNonQuery();
		}

		string GetConnectionString()
		{
			return string.IsNullOrEmpty(User)
				? string.Format(@"Data Source={0};Initial Catalog={1};Integrated Security=True", Server ?? "", Catalog ?? "")
				: string.Format(@"Data Source={0};Initial Catalog={1};Persist Security Info=True;User ID={2};Password={3}", Server ?? "", Catalog ?? "", User, Password ?? "");
		}
	}
}
