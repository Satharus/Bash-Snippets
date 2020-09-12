# Bash-Snipets
A collection of random scripts I wrote in BASH for whatever reason.

## OSC's Put-Logo Script's GUI (PutlogoGUI.sh)

Gives a logo and a directory full of images, it adds the logo to the the images.

You can also set which corner to put the logo on and the size of the logo.


####  Usage:
`./PutlogoGUI.sh`

and then follow the instructions on the screen.

[Link to the repo](https://github.com/Satharus/Put-Logo-Script)

[Link to the script](https://github.com/Satharus/Put-Logo-Script/blob/master/PutlogoGUI.sh)

## DownloadCourses.sh

Makes it easier to download edX and Coursera courses automatically.

It uses the utilities "edx-dl" and "coursera-dl".
####  Usage:
`./DownloadCourses.sh`

and then follow the instructions on the screen.

[Link to the script](https://github.com/Satharus/Bash-Snipets/blob/master/DownloadCourses.sh)


## SetAlbums.sh

Converts audio files to .mp3 320Kbps and then sets the album name, cover, and artist name.

It uses the utilities "tageditor" and "ffmpeg".

#### Usage:
`./SetAlbums.sh [Tracklist]`

Where Tracklist is a file that contains the paths of the tracks to be edited, one per line.

[Link to the script](https://github.com/Satharus/Bash-Snipets/blob/master/SetAlbums.sh)


## DivideImages.sh

Given a width and height, it divides the image into files of equal width and height.

It uses imagemagick.

![Demonstration of what it does](https://github.com/Satharus/Bash-Snipets/blob/master/Demonstrations/Crop.png)

#### Usage:
`./DivideImages.sh [Width] [Height] [Image] [IncludeName]`

Where Width and Height are the size of the partitions you want.

Set IncludeName to 1 if you want the output to be X_Y_name.png instead of X_Y.png. Otherwise, leave it empty.

[Link to the script](https://github.com/Satharus/Bash-Snipets/blob/master/DivideImages.sh)


## ReconstructImage.sh

This reconstructs the image that was divided by DivideImage.sh.

It also uses imagemagick.

#### Usage:
`./ReconstructImage.sh`

Just run it from the directory where the divided images are. The final image will be output.png.

[Link to the script](https://github.com/Satharus/Bash-Snipets/blob/master/ReconstructImage.sh)



## decodefile.sh

Given a list of files that are encoded in base64, it decodes them.

#### Usage:
`./decodefile.sh [File]`

Where File is a file that containts the paths of the files to be decoded, one per line.

[Link to the script](https://github.com/Satharus/Bash-Snipets/blob/master/decodefile.sh)


## decodename.sh

Given a list of files that have their names encoded in base64, it decodes their names and renames the files to their new names.

#### Usage:
`./decodename.sh [File]`

Where File is a file that containts the paths of the files whos names are to be decoded, one per line.

[Link to the script](https://github.com/Satharus/Bash-Snipets/blob/master/decodename.sh)

