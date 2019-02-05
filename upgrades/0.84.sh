#
#   AIS dom upgrade script to version 0.84.x
#
#   Homepage: https://ai-speaker.com
#
# curl https://raw.githubusercontent.com/sviete/AIS-utils/master/upgrades/0.84.sh | bash
################################################
echo "-----------------------------"
echo "-----------------------------"
echo "-----------------------------"
echo $(date '+%Y %b %d %H:%M') START
echo "-----------------------------"
echo "AIS dom upgrade to version 0.84.x"
echo "-----------------------------"
echo "-----------------------------";
echo "Install dom-tunnel ----------";
echo "-----------------------------";
echo "inception... go deeper..."
ssh localhost -o StrictHostKeyChecking=no -p 8022 -i /data/data/pl.sviete.dom/files/home/AIS/www/id_rsa_ais << EOF
npm install -g dom-tunnel
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace
EOF
echo "inception... go back"
echo "-----------------------------";
echo "Upgrade pip------------------";
echo "-----------------------------";
pip install pip -U
echo "-----------------------------";
echo "Downloading lovelace json----";
echo "-----------------------------";
curl -o "/data/data/pl.sviete.dom/files/home/AIS/.storage/lovelace" -L  https://raw.githubusercontent.com/sviete/AIS-utils/master/patches/scripts/lovelace;
echo "-----------------------------------"
echo "Downloading Android apks for AIS dom"
echo "-----------------------------------"
echo "-----------------------------------"
echo "AisExplorer"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisExplorer.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisExplorer.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisExplorer.apk" &&
echo "-----------------------------------"
echo "AisLauncher"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisLauncher.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisLauncher.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisLauncher.apk" &&
echo "-----------------------------------"
echo "AisSynchro"
echo "-----------------------------------"
curl -o "/data/data/pl.sviete.dom/files/usr/tmp/AisSynchro.apk" -L https://github.com/sviete/AIS-WWW/raw/master/ota/android/AisSynchro.apk &&
su -c "pm install -r /data/data/pl.sviete.dom/files/usr/tmp/AisSynchro.apk" &&

echo "all done"
echo $(date '+%Y %b %d %H:%M') STOP
