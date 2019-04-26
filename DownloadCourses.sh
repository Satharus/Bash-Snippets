####################################### START
echo "Coursera or Edx?"
echo -n  "1-Coursera"
echo "		2-Edx"
read choice
echo ""
######################################## Coursera
if [[ choice -eq 1 ]]
then 
	FILE=$HOME"/.coursesc"
	echo -n  "Enter your username: " 
	read username
	echo -n "Enter your password: "
	read password
	coursera-dl -u $username -p $password --list-courses 2> $FILE
	
	length=$(wc -l $FILE | cut -d ' ' -f 1)
	
	sed -n 4p $FILE
	for a in `seq 1 $(($length-4))`
	do
		echo -n  "$a - "
		sed -n $(($a + 4))"p" $FILE
	done
	
	echo ""; echo -n  "Enter the number of the course to download: "
	read x
	name=$(sed -n $(($x + 4))"p" $FILE)	
	coursera-dl -u $username -p $password -sl "en" --path  $HOME"/Downloads/Coursera" --download-quizzes --download-notebooks  $name
######################################## Edx
elif [[ choice -eq 2 ]]
then
	FILE=$HOME"/.courses"
	echo -n  "Enter your username: " 
	read username
	echo -n "Enter your password: "
	read password
	edx-dl -u  $username  -p $password  --list-courses  2> $FILE

	tail -n +7 $FILE
	echo ""; echo -n "Enter the number of the course to download: "
	read x 

	URL=$(cat $FILE | grep -iw -A1 "$x -" | grep https)

	edx-dl -u  $username  -p $password --output-dir $HOME"/Downloads/Edx" -s $URL
fi
######################################## FINISH
