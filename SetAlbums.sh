ffmpegInstalled=true
tageditorInstalled=true
#Checks that ffmpeg is installed.
if ! [ -x "$(command -v ffmpeg)" ] 
then
	echo "You don't have ffmpeg installed, please install it before trying to run this script."
	echo "Check https://ffmpeg.org/"
	ffmpegInstalled=false
fi
#Checks that tageditor is installed.
if ! [ -x  "$(command -v tageditor)" ]
then
	echo "tageditor isn't installed, please install it before trying to run this script."
	echo "Check https://github.com/Martchus/tageditor"
    tageditorInstalled=false
fi

#Exits if either of them aren't installed.
if ! [[ $ffmpegInstalled == true && $tageditorInstalled == true ]]
then
    exit
fi

x=$(wc -l $1 | cut -d ' ' -f 1)
echo "reading $x lines from $1"

for n in `seq 1 $x`
do
    echo -n "Enter album name: "
    read albumname
    echo -n "Enter the path for the album cover: "
    read coverPath
    echo -n "Enter the artist name: "
    read artistName
    
	filename="$(sed -n "$n"p $1)"
	trackname="$(sed -n "$n"p $1 | cut -d '.' -f 1)"
	ffmpeg -i "$filename" "$trackname.mp3" -b:a 320000 
	tageditor -s --values title="$trackname" album="$albumname" cover="$coverPath" artist="$artistName" -f "$trackname.mp3"
done
