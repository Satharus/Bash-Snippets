
x=$(wc -l $1 | cut -d ' ' -f 1) #Count the number of files
echo "Reading $x lines from $1"

for n in `seq 1 $x`
do
	filename="$(sed -n "$n"p $1 | cut -d '.' -f 1)" #Get file name
    extension="$(sed -n "$n"p $1 | cut -d '.' -f 2)" # Get extension
	decodedfilename=$(echo $filename | base64 -d) #Decode the filename
	mv -v "$filename.$extension" "$decodedfilename.$extension" #rename
done
