print "Paste in interface:\n";
print "Type Done when paste is complete\n";

$interface = "";
while ($line = <>)
{	
	if ($line =~ m/done/i)
	{
		last;
	}
	
	$interface .= $line;
}

my @matches = $interface =~ m/((?:-|\+)\s?\(.+\)(?:\w+(?::\(.+\))?)+(?=;))/gi;

$implementation = "";

foreach (@matches)
{
	$implementation .= $_ . "\n{\n";
	
	# determine what to return 
	if ($_ =~ m/(-|\+)\s?\(instancetype\)/)
	{
		# self
		$implementation .= "\treturn self;";
	}
	elsif ($_ =~ m/(-|\+)\s?\(void\)/)
	{
		;
	}
	elsif ($_ =~ m/(-|\+)\s?\(id\)/ || $_ =~ m/(-|\+)\s?\(\w+\*\)/)
	{
		# object
		$implementation .= "\treturn nil;";
	}
	elsif ($_ =~ m/(-|\+)\s?\(\w+\)/)
	{
		# primitive
		$implementation .= "\treturn 0;";
	} 
	
	$implementation .= "\n}\n\n";
}

print $implementation;