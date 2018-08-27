# Description: Using Win32::Service module to access Windows service
use Win32::Service;

# All of the functions return FALSE (0) if they fail, unless otherwise noted.

my %hash = ();
Win32::Service::GetServices("192.168.161.133", \%hash);

#Print the services
#sort(%hash);
while (($first, $last) = each(%hash)) {
    print "$first --------->$last\n";
}

# Different ways of starting a service
Win32::Service::StartService("192.168.0.1", "DNS Client");
Win32::Service::StartService("127.0.0.1", "iPod Service");
Win32::Service::StartService("VIKASH-LAPTOP", "iPod Service");      # Provided DNS is configured
Win32::Service::StartService("", "iPod Service");				    # Local host

# Other methods
#Win32::Service::StopService("VIKASH-LAPTOP", "Telnet");
#Win32::Service::PauseService("192.168.0.1", "iPod Service");

# Services on Remote Machine
#Win32::Service::StartService("192.168.161.133", "iPod Service");    # If has permissions
