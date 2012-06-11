#!/bin/bash

echo "JUZU APPLICATION GENERATOR 0.1"
echo ""
echo "What is the Application name ?"
echo -n "#> "
read IN

NAME=`echo $IN | tr "[:upper:]" "[:lower:]" | sed "s/ //g"`
UNAME="`echo "${NAME:0:1}" | tr "[:lower:]" "[:upper:]"``echo "${NAME:1}" | tr "[:upper:]" "[:lower:]"`"
TITLE="`echo "${IN:0:1}" | tr "[:lower:]" "[:upper:]"``echo "${IN:1}" | tr "[:upper:]" "[:lower:]"`"

#echo ""
#echo "Which template do you want to use for this new application ?"
#echo " 1 - Create a simple portlet application"
#echo " 2 - Create an empty portlet"
#echo -n "#> "
#read CHOICE


echo ""
echo "We're now downloading a few resources to create the application '$NAME'..."
eval curl -# -L http://github.com/downloads/benjp/juzu-creator/juzu-sample.zip --O juzu-temp.zip
rm -Rf juzu-sample
unzip -q juzu-temp.zip
rm juzu-temp.zip

echo ""
echo "Preparing application '$NAME'..."
cd juzu-sample
mv src/main/java/org/gatein/portal/name "src/main/java/org/gatein/portal/$NAME"
find . | xargs perl -Xpi -e "s/{{name}}/$NAME/g"
find . | xargs perl -Xpi -e "s/{{uname}}/$UNAME/g"
find . | xargs perl -Xpi -e "s/{{title}}/$TITLE/g"

cd ..
mv juzu-sample "juzu-$NAME"

echo ""
echo ""
echo "Application '$NAME' is now ready, enjoy !"
echo ""
echo ""
