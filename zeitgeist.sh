#! /bin/sh

username='PLEASE_ENTER_USERNAME'
password='PLEASE_ENTER_PASSWORD'
targetdir='/tmp/zeitgeist/'

y=`date +%-y`
w=$[`date +%-W`+1]

if [ ${w} -lt 10 ]; then
	w=0${w};
fi
if [ ${w} -gt 52 ]; then
	w=0$[$w-52]
	y=$[$y + 1]
fi

echo 'Zeitgeist by Console++ / frame@console.cc';
echo 

echo Fetching Audio_${y}${w}.zip ...
wget -q --no-check-certificate --user=${username} --password=${password} -O ${targetdir}Audio_${y}${w}.zip "https://premium.zeit.de/cgi-bin/_er_member/p4z.fpl?ER_Do=prepareBuyDocument&Abo_Document=/media/${y}/${w}/Audiofiles_DIE_ZEIT_${w}.zip&Abo_ServerName=horchen.zeit.de"

echo Fetching ePaper_${w}${y}.pdf ...
wget -q --user=${username} --password=${password} -O ${targetdir}ePaper_${y}${w}.pdf "http://epaper.zeit.de/archiv/DZ/pdf/DZ_ePaper_${w}_${y}.pdf"
