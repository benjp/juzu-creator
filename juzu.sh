#!/bin/bash

echo "JUZU APPLICATION GENERATOR FOR JUZUWEB 0.6.0"
echo ""
echo "What is the Application name ?"
echo -n "#> "
read IN

NAME=`echo $IN | tr "[:upper:]" "[:lower:]" | sed "s/ //g"`
UNAME="`echo "${NAME:0:1}" | tr "[:lower:]" "[:upper:]"``echo "${NAME:1}" | tr "[:upper:]" "[:lower:]"`"
TITLE="`echo "${IN:0:1}" | tr "[:lower:]" "[:upper:]"``echo "${IN:1}" | tr "[:upper:]" "[:lower:]"`"
SAMPLE="juzu-sample-copy"
#echo ""
#echo "Which template do you want to use for this new application ?"
#echo " 1 - Create a simple portlet application"
#echo " 2 - Create an empty portlet"
#echo -n "#> "
#read CHOICE


echo ""
echo "We're now downloading a few resources to create the application '$NAME'..."
eval curl -# -L https://raw.github.com/benjp/juzu-creator/master/data/juzu-sample-0.6.0.zip --O juzu-temp.zip
rm -Rf juzu-sample
echo ""
echo "Unpacking Sample Application bundle..."
unzip -q juzu-temp.zip
rm juzu-temp.zip

echo ""
echo "Preparing application '$NAME'..."
cd $SAMPLE
mv src/main/java/name "src/main/java/$NAME"
find . | xargs perl -Xpi -e "s/{{name}}/$NAME/g"
find . | xargs perl -Xpi -e "s/{{uname}}/$UNAME/g"
find . | xargs perl -Xpi -e "s/{{title}}/$TITLE/g"

cd ..
mv "$SAMPLE" "juzu-$NAME"

cd "juzu-$NAME"
echo ""
echo "Building application '$NAME'..."
mvn clean install

echo ""
echo ""
echo "Application '$NAME' is now ready, enjoy !"
echo ""
echo ""
