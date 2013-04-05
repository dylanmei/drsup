using System;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;

namespace drsup
{
	class ScriptRunner
	{
		public string Server { get; set; }
		public string Catalog { get; set; }
		public string User { get; set; }
		public string Password { get; set; }
		public bool Trusted { get; set; }

		string GetArguments()
		{
			var arguments = string.Format(@" -S {0} -d {1}", Server, Catalog);
			return Trusted
				? string.Concat(arguments, " -E")
				: string.Concat(arguments, string.Format(@" -U {0} -P {1}", User, Password));
		}

		ProcessStartInfo GetStartup(string path)
		{
			var arguments = GetArguments();
			arguments = string.Concat(arguments, @" -i """, path, @"""");
			return new ProcessStartInfo("sqlcmd", arguments)
			{
				UseShellExecute = false,
				CreateNoWindow = true,
				WindowStyle = ProcessWindowStyle.Hidden,
				RedirectStandardOutput = true
			};
		}

		public void Run(Script script)
		{
			Console.WriteLine("running script {0}: {1}", script.Version, script.Name);
			var startup = GetStartup(script.Path);
			var process = new Process {StartInfo = startup};
			process.Start();
			process.WaitForExit();

			var code = process.ExitCode;
			var result = process.StandardOutput.ReadToEnd();
			if (code != 0 || IsUnexpectedResult(result))
				ThrowUnexpectedResult(code, result);
		}

		static bool IsUnexpectedResult(string results)
		{
			if (string.IsNullOrEmpty(results)) return false;

			var match = new Regex(@"Msg\s(?<Msg>\d+),\sLevel\s(?<Level>\d+),\sState\s(?<State>\d+)")
				.Match(results);

			if (!match.Success) return false;

			return IsUnexpectedResult(
				Convert.ToInt32(match.Groups["Msg"].Value),
				Convert.ToInt32(match.Groups["Level"].Value),
				Convert.ToInt32(match.Groups["State"].Value));
		}

		static bool IsUnexpectedResult(int msg, int level, int state)
		{
			return true;
		}

		static void ThrowUnexpectedResult(int code, string results)
		{
			throw new ApplicationException(
				string.Format("sqlcmd process exited with code {0} and message: {1}", code, results));
		}
	}
}