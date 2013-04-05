using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace drsup
{
	class ScriptFinder
	{
		static readonly Regex _Pattern = new Regex(@"([0-9]+)_([a-zA-Z0-9_\-]+).sql$");
		public string Folder { get; set; }

		public IEnumerable<Script> NewScripts(int version)
		{
			var scripts = new List<Script>();
			var directory = Folder ?? ".";
			foreach (var path in Directory.GetFiles(directory, "*.sql"))
			{
				var script = NewScript(path);
				if (script == null) continue;
				if (script.Version > version)
					scripts.Add(script);
			}

			return scripts.OrderBy(s => s.Version);
		}

		static Script NewScript(string path)
		{
			var match = _Pattern.Match(path);
			if (!match.Success) return null;

			var script = new Script {
				Path = match.Groups[0].Value,
				Version = Convert.ToInt32(match.Groups[1].Value),
				Name = match.Groups[2].Value
			};
			return script;
		}
	}
}