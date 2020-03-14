# dd-backup-helper-script
Creates a dd backup script on Android device see example.txt. 
 
 Needs root use (mtk-su)
 
 adb push dd-backup.sh /data/local/tmp
 
 adb shell
 
 cd /data/local/tmp
 
 chmod 755 dd-backup.sh
 
 ./dd-backup.sh
 
 Now simply copy and paste the dd commands of the partition you want to backup 
 into your root shell.
 
 
 When completed use 
 
 adb pull /sdcard/dd-backup/boot.img /your/destination/folder
