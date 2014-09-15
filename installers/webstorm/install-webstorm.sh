#!/bin/sh
SHORTCUT="[Desktop Entry]
Name=WebStorm 8.0
Comment=Edit text files
Exec=/usr/local/web-storm/bin/webstorm.sh
Icon=/usr/local/web-storm/bin/webide.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Utility;TextEditor;JavaScript;Development;"
SCRIPT="#!/bin/sh
if [ \${1} == \"--help\" ]; then
/usr/local/web-storm/bin/webstorm.sh --help
else
/usr/local/web-storm/bin/webstorm.sh \$@ s> /dev/null 2>&1 &
fi"

curl -L "http://download.jetbrains.com/webstorm/WebStorm-8.0.4.tar.gz" -o "/usr/src/WebStorm.tar.gz"
cd /usr/src
tar -zxvf "WebStorm.tar.gz"
cd "WebStorm-135.1063"
mkdir -pv "/usr/local/web-storm"
mv -fv * "/usr/local/web-storm/"
echo "${SCRIPT}" > "/usr/local/bin/webstorm"
chmod +x "/usr/local/bin/webstorm"
echo "${SHORTCUT}" > "/usr/share/applications/web-storm.desktop"

echo "Finish!"
