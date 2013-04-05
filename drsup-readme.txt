dylan's rad sql update processer
when changing schema, create a new update script rather than changing an old one
to see and manipulate what version we are at, try select * from [schema-version]

usage:
	drsup -s Server -c Catalog [-u User -p Password]
without -u and -p it will run using our identity
the executable 'sqlcmd' should be on our path
