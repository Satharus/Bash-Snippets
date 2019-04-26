
x=$(wc -l $1 | cut -d ' ' -f 1) #Count the number of files
echo "Reading $x lines from $1"

for n in `seq 1 $x`
do
	filename="$(sed -n "$n"p $1)" #Get the file name
	newfilename="de$filename" 
	base64 -d $filename > $newfilename #Decode the file and redirect the output.
done
