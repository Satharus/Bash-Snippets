## This part was required for a specific case where the file names were decoded.
#Decode all of the image file names (base64)
# for filename in `ls *.png`
# do
#     #Get the name of the file
#     bn=`echo $filename | cut -d '.' -f 1`
#     #Decode the name
#     newName=`echo $bn | base64 -d`.png
#     #Copy rename the file
#     cp $filename renamed_files/$newName
# done
# echo "Successfuly decoded base 64 named files"

#Get max width and height by sorting each dimension and getting the max.
maxWidth=`ls | cut -d '_' -f 1 | sort -nu | tail -n 1`
maxHeight=`ls | cut -d '_' -f 2 | cut -d '.' -f 1 | sort -nu | tail -n 1`

printf "Max Width:\t%d\nMax Height:\t%d\n"  $maxWidth $maxHeight


#Construct the columns first
mkdir columns 

#Construct the following command to keep the files in order
#convert input1 input2 ... [-/+]append columns/_.png
#This MAY be limited by ARG_MAX in your system.

convertCommand=""
for i in `seq 0 $maxWidth`
do
convertCommand="convert "
    for j in `seq 0 $maxHeight`
    do
        convertCommand=$convertCommand" "$i"\_"$j".png "
    done
    convertCommand=$convertCommand" -append columns/$i.png"
    $convertCommand
    convertCommand="" #Reset the command string
    echo "Successfuly recreated columns/$i.png"
done

#Join the columns to construct the final image. 
convertCommand="convert "
for i in `seq 0 $maxWidth`
do
    convertCommand=$convertCommand"columns/"$i".png "
done

$convertCommand +append output.png
echo "Successfuly recreated the image at ./output.png"
