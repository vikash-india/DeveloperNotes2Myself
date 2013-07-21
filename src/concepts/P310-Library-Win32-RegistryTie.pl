# Description: Using Win32::TieRegistry module to create registry keys
use Win32::TieRegistry( Delimiter=>"/" );

# Opening keys
$swKey= $Registry->{"LMachine/Software/Dendrite/Vikash"};

# Reading Values
$name = $swKey->{"/Name"};					# To get the value for Name under Dendrite
$default = $swKey->{"/"};					# To get the default value

# Printing Values
print $name."\n";
print $default."\n";

# Accessing Remote Registry (if Registry Services are running on the remote machine)
#$remoteKey= $Registry->{"//192.168.161.22/LMachine/Software/Microsoft/Windows/CurrentVersion/"}; # Opening
$remoteKey= $Registry->{"LMachine/Software/Microsoft/Windows/CurrentVersion/"}; # Opening
$progDir= $remoteKey->{"/ProgramFilesDir"};    # Reading and it should give "C:\\Program Files"
print $progDir."\n";						   # Printing

# Setting Values
$swKey->{"/"}= [ "13", "REG_SZ" ];					# "\x00" and "\0" used to mark ends of each string and end of list.
$swKey->{"/Name"}= [ "Veeru\0\0", "REG_MULTI_SZ" ]; # "\x00" and "\0" used to mark ends of each string and end of list.
$swKey->{"/Name2"}= [ "Eranna\0\0", "REG_SZ" ];		# "\x00" and "\0" used to mark ends of each string and end of list.

$swKey->{"/Value1"}= [ pack("S",10), "REG_BINARY" ];	# S for Small ie 4 bytes
$swKey->{"/Value2"}= [ pack("L",10), "REG_BINARY" ];	# L for Large ie 8 bytes

# Creating Keys and Sub Keys
$swKey->{"FooCorp/"}= {
        "FooWriter/" => {
            "/Version" => "4.032",
            "Startup/" => {
                "/Title" => "Foo Writer Deluxe ][",
                "/WindowSize" => [ pack("LL",$wid,$ht), REG_BINARY ],
                "/TaskBarIcon" => [ "0x0001", REG_DWORD ],
            },
            "Compatibility/" => {
                "/AutoConvert" => "Always",
                "/Default Palette" => "Windows Colors",
            },
        },
        "/License", => "0123-9C8EF1-09-FC",
    };

# Deleting values or keys with no subkeys
$oldValue= delete $swKey->{"FooCorp"}->{"/License"};
$oldValue= delete $swKey->{"FooCorp"}->{"FooWriter/"};

# Closing keys
undef $swKey;					# Explicit way to close a key.
$remoteKey = "Anything else";   # Implicitly closes a key.
exit 0;							# Implicitly closes all keys.