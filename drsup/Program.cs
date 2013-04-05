using System;
using System.Collections.Generic;
using System.Linq;

namespace drsup
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("drsup -s Server -c Catalog [-u User -p Password]");
			var arguments = GetArguments(args);
			if (arguments.Count() == 0) return;

			var server = arguments.SingleOrDefault(a => a.Name == "s") ?? new Argument("s");
			var catalog = arguments.SingleOrDefault(a => a.Name == "c") ?? new Argument("c");
			var user = arguments.SingleOrDefault(a => a.Name == "u") ?? new Argument("u");
			var password = arguments.SingleOrDefault(a => a.Name == "p") ?? new Argument("p");

			var processor = new SqlProcessor {
				Catalog = catalog.Value,
				Password = password.Value,
				User = user.Value,
				Server = server.Value
			};

			var response = processor.TryConnect();
			if (response != null)
			{
				Console.WriteLine(response);
			}
			else
			{
				var version = processor.GetVersion();
				Console.WriteLine("current version = {0}", version);
				var reader = new ScriptFinder();
				foreach (var script in reader.NewScripts(version))
				{
					processor.RunScript(script);
				}
			}

			Console.WriteLine("Done.");
			Console.ReadLine();
		}

		static IEnumerable<Argument> GetArguments(string[] args)
		{
			var i = 0;
			var arguments = new List<Argument>();

			while (i < args.Length - 1)
			{
				var key = args[i++];
				if (!key.StartsWith("-") || key.Length != 2) continue;
				var value = args[i++];
				var argument = new Argument(key.Substring(1)) { Value = value };
				arguments.Add(argument);
			}

			return arguments;
		}
	}
}
