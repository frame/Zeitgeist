#! /bin/sh

username='PLEASE_ENTER_USERNAME'
password='PLEASE_ENTER_PASSWORD'
targetdir='/tmp/zeitgeist/'

y=`date +%-y`
Y=`date +%-Y`
w=$[`date +%-W`+1]

if [ ${w} -lt 10 ]; then
	w=0${w};
fi
if [ ${w} -gt 52 ]; then
	w=0$[$w-52]
	y=$[$y + 1]
	Y=$[$Y + 1]
fi

echo 'Zeitgeist v1.9';
echo 'by Console++ / frame@console.cc';
echo 

echo Logging in ...
wget -q --cookies=on --keep-session-cookies --save-cookies=${targetdir}cookie.txt --post-data="name=${username}&pass=${password}&form_id=user_login_block" -O /dev/null https://premium.zeit.de/abo/zeit_digital

echo Fetching Audio_${y}${w}.zip ...
wget -q --cookies=on --keep-session-cookies --load-cookies=${targetdir}cookie.txt -O ${targetdir}Audio_${y}${w}.zip "https://premium.zeit.de/system/files/audio/DZ/${Y}/Audiofiles_DIE_ZEIT_${w}.zip"

echo Fetching ePaper_${w}${y}.pdf ...
wget --cookies=on --keep-session-cookies --load-cookies=${targetdir}cookie.txt -O ${targetdir}ePaper_${y}${w}.pdf "https://premium.zeit.de/system/files/epaper/DZ/pdf/DZ_ePaper_${w}_${y}.pdf"

rm -f ${targetdir}cookie.txt