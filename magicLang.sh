#!/bin/zsh

# ./magicLang.sh n 111
# ./magicLang.sh g

function n() {
echo '# 

原文：[]()  
翻译：[MagicLang](http://artwalk.github.io//2017/05/11/MagicLang)

<!--more-->
' > ./Contents/$1.md
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

commit=$(tail -1 README.md | cut -c5- | cut -d']' -f1)
git commit -a -m $commit
git push
}

case $1 in
"n")
n $2;;
"g")
g;;
esac