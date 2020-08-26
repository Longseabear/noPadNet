#!/bin/sh

#download celebA-HQ dataset with bash script

#1. make ~/.bash_aliases and add the following codes to gdrive_download (alias command):

#function gdrive_download () {
#  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
#  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
#  rm -rf /tmp/cookies.txt
# }

#2. Add the following codes to ~/.bashrc:

#if [ -f "${HOME}/.bash_aliases" ]; then
#    source "${HOME}/.bash_aliases"
#fi


#3. After source ~/.bashrc, run this script as below,

# bash download_celebA-HQ.sh save_dir


source ~/.bashrc #to use alias command

save_dir="/media/leaps/dataset/celebA_wild/"
if [ ! -e $save_dir ]; then
    mkdir $save_dir
fi

drive_ids=(
        '0B7EVK8r0v71pQy1YUGtHeUM2dUE' '0B7EVK8r0v71peFphOHpxODd5SjQ'
        '0B7EVK8r0v71pMk5FeXRlOXcxVVU' '0B7EVK8r0v71peXc4WldxZGFUbk0'
        '0B7EVK8r0v71pMktaV1hjZUJhLWM' '0B7EVK8r0v71pbWFfbGRDOVZxOUU'
        '0B7EVK8r0v71pQlZrOENSOUhkQ3c' '0B7EVK8r0v71pLVltX2F6dzVwT0E'
        '0B7EVK8r0v71pVlg5SmtLa1ZiU0k' '0B7EVK8r0v71pa09rcFF4THRmSFU'
        '0B7EVK8r0v71pNU9BZVBEMF9KN28' '0B7EVK8r0v71pTVd3R2NpQ0FHaGM'
        '0B7EVK8r0v71paXBad2lfSzlzSlk' '0B7EVK8r0v71pcTFwT1VFZzkzZk0'
   )

for i in `seq -w 1 014`
do
    if [ ! -e $save_dir/img_celeba.7z.$i ]; then
        num=$(( 10#$i -1 )) #drive_ids array starts from 0
        gdrive_download ${drive_ids[$num]} $save_dir/img_celeba.7z.$i
    fi
done