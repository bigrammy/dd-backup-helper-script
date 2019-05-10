##
# dd-backup helper script
# by @mrmazak @bigrammy @ xda-developers

echo "##################################################"
echo "##################################################"
echo "##                                              ##"
echo "##             dd-backup script                 ##"
echo "##                                              ##"
echo "##                 Generator                    ##"
echo "##                                              ##"
echo "##          Quick Easy and Universal            ##"
echo "##                                              ##"
echo "##     by: xda members @mrmazak @bigrammy       ##"
echo "##                                              ##"
echo "##################################################"
echo "##################################################"


mkdir /sdcard/dd-backup
echo "1. The dd-backup folder is created!"
echo ""
echo "2. Searching for by-name!"
echo ""
find /dev -name by-name -exec find {} -print > /sdcard/dd-backup/1.txt \;
echo "3. Folder located!"
echo ""
echo "4. Begin editing script!"
echo ""
#strip first line as it's not needed
sed -i '1d' /sdcard/dd-backup/1.txt
#end of first line strip

#fix last line error. 
#sed needs extra line or it will miss the last line
#due to no \n
#add extra newline
echo >> /sdcard/dd-backup/1.txt
#add extra newline done
echo "5. Done basic editing"
echo ""
echo "6. Adding dd if cmd's"
echo ""
sed 's_/dev_dd if=/dev_' </sdcard/dd-backup/1.txt >/sdcard/dd-backup/2.txt

echo "7. Adding dd of cmd's"

sed ':a;N;$!ba;s/\n/ of=\/sdcard\/\dd-backup\n/g' </sdcard/dd-backup/2.txt >/sdcard/dd-backup/3.txt
echo ""
# Fix another bit of puzzel
# Get the list of names and trim the "me"
echo "8. Getting all the partition names!"
grep -oE 'me/[^ ]*' /sdcard/dd-backup/3.txt|cut -c 3-19 >/sdcard/dd-backup/4.txt

#add extra newline as before
echo >> /sdcard/dd-backup/4.txt

#add .img to partition names
sed ':a;N;$!ba;s/\n/.img\n/g' </sdcard/dd-backup/4.txt >/sdcard/dd-backup/5.txt
#done add .img to partition names
#paste cmd failed on 6.0 maybe 7.0 too"
#paste /sdcard/dd-backup/3.txt /sdcard/dd-backup/5.txt >/sdcard/dd-backup/6.txt
#echo "done paste"
#below used to remove spaces but not needed with new method.
#sed 's/backup[ \t]/backup/g' </sdcard/dd-backup/6.txt >/sdcard/dd-backup/dd-backup.txt
echo ""
#Thanks to stackoverflow member ghostdog74 for alt paste method
echo "9. Joining files!"
exec 6<"/sdcard/dd-backup/5.txt"
while read -r line
do
    read -r f2line <&6
    echo "${line}${f2line}"
done <"/sdcard/dd-backup/3.txt" | tee /sdcard/dd-backup/dd-backup.txt
exec 6<&-
#paste done.
echo ""
echo "10. Cleaning up!"

rm /sdcard/dd-backup/1.txt
rm /sdcard/dd-backup/2.txt
rm /sdcard/dd-backup/3.txt
rm /sdcard/dd-backup/4.txt
rm /sdcard/dd-backup/5.txt
echo ""
echo "11. dd-backup.txt created!"
echo ""
echo "12.!!!! Credits !!!!!"
echo ""
echo "@mrmazak for amazing code skills"
echo ""
echo "@diplomatic for mtk-su!"
echo ""
echo "@bigrammy for my time & effort"
echo ""
echo "@HemanthJabalpuri for helping"
echo ""
echo "@Rortiz2 for all the testing"
echo ""
echo "Hit the above's THANKS Buttons"


exit
