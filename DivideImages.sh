
x=`identify -format "%w" $3` #Get width
let x=$(($x/$1)) #Get the number of partitions in X
y=`identify -format "%h" $3` #Get height
let y=$(($y/$2)) #Get the number of partitions in Y

for i in `seq 0 $(($x-1))`
do
	for j in `seq 0 $(($y-1))`
	do
		convert -crop $1x$2+$(($1 * $i))+$(($2 * $j)) $3 "$i$j`basename $3`"
		#-crop option takes widthxheight+Xoffset+Yoffset
		#See man convert for more info 
	done
done
