#!/usr/bin/env bash



MANPATH="/usr/share/man"
ARGn=$#
ARGs=$*

echo "位置参数个数为 " $ARGn
echo "所有位置参量" $*

if [[ $ARGn = 0 ]]; then
	echo "命令格式: prtman 后跟要打印的man部分数字"
	echo "prtman 1 2 ... "
	echo ""
	exit 0
fi

echo "设置输出的目录 "
echo "例如 man"

read OUTPATH

[ ! -d ./"$OUTPATH" ] && mkdir  "./$OUTPATH"  

for i in $ARGs
do
	[ ! -d "./$OUTPATH/${i}" ] && mkdir -p "./$OUTPATH/${i}"  
	
	echo "当前目录为 " $OUTPATH/${i}
	
	filelist=$( ls $MANPATH/man${i}/ )
	echo "获得、修改后的文件名列表" $filelist
	for j in $filelist
	do
		itemname=${j%.${i}}
		echo $itemname
		man ${i} ${itemname}  | col -b > "$OUTPATH/${i}/${itemname}.txt"
		
	done
	echo $OUTPATH
	
	
done




