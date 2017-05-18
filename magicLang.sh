#!/bin/zsh

function n() {
	echo '# 

原文：[]()

<!--more-->

翻译 [MagicLang](https://github.com/Artwalk/MagicLang)' > ./Contents/$1.md
}

function g() {
value=""
for i in `ls -d Contents/*`
do
	h=`head -1 $i | sed 's/# /1. [/'`
	if [ "$i" ]; 
		then
		value+="$h]($i)\n"
	fi
done 

value=`echo $value | sed -e 's/^$//'`
perl -i -pe 's|^1. \[.*$\\n||g' README.md
perl -i -pe 's|^$||g' README.md

echo $value >> README.md
}

case $1 in
"n")
n $2;;
"g")
g;;
esac