#!/bin/bash

# ----------------------- Settings -------------------------------

MIDDLEMAN_BUILD_DIR="middleman_build"
PHONEGAP_BUILD_DIR="phonegap_build"
REMOTE_SERVER_URL='http://jasper-prototype-server.herokuapp.com'
LOCAL_SERVER_URL='http://jasper-server.dev'

# ------------- Edit below on your own risk ----------------------



# derived variables
SRC_INDEX_FILE=$MIDDLEMAN_BUILD_DIR/index.html
DESTINATION_INDEX_FILE=$PHONEGAP_BUILD_DIR/index.html

# http://stackoverflow.com/questions/407523/escape-a-string-for-sed-search-pattern
ESCAPED_REMOTE_SERVER_URL=$(echo $REMOTE_SERVER_URL | \
  sed -e 's/[\/&]/\\&/g' | sed -e 's/\-/\\\-/g')

ESCAPED_LOCAL_SERVER_URL=$(echo $LOCAL_SERVER_URL | \
  sed -e 's/[]\/()$*.^|[]/\\&/g' | sed -e 's/\-/\\\-/g')

function print_message {
   echo ""
   echo $1
   echo "-------------------------------------------"
   echo ""
}

# ----------------------------------------------------------------
print_message "Clearing phonegap and middleman build dirs"

folders=( $MIDDLEMAN_BUILD_DIR $PHONEGAP_BUILD_DIR ) 
for file in "${folders[@]}"
do
  if [ -e $file ]
  then
    rm -R $file
  fi
done

# ----------------------------------------------------------------
print_message "Building middleman project"
middleman build

# ----------------------------------------------------------------
print_message "Running r.js optimizer"
r.js -o ./build.js

# ----------------------------------------------------------------
print_message "Injecting new application.js into index file"

# can't make sed to work with whitespace in reges,
# so doing processing twice
SOURCE_REGEX="src=\"javascripts\/lib\/require\.js\""
DESTINATION_REGEX="src=\"javascripts\/application\.js\""
STR_TO_REMOVE="data\-main=\"javascripts\/application\"" 

cat $SRC_INDEX_FILE | \
  sed -e "s/"$SOURCE_REGEX"/"$DESTINATION_REGEX"/g" | \
  sed -e "s/"$STR_TO_REMOVE"//g" > $DESTINATION_INDEX_FILE

  
# ----------------------------------------------------------------
print_message "Setting remote server url"

FILE_CONTENTS=$(cat $DESTINATION_INDEX_FILE)
echo "$FILE_CONTENTS" | \
  sed -e "s/"$ESCAPED_LOCAL_SERVER_URL"/"$ESCAPED_REMOTE_SERVER_URL"/g" \
  > $DESTINATION_INDEX_FILE


# ----------------------------------------------------------------
print_message "Copying stylesheets and images"
mkdir -p $PHONEGAP_BUILD_DIR/stylesheets
cp -R $MIDDLEMAN_BUILD_DIR/stylesheets/application.css $PHONEGAP_BUILD_DIR/stylesheets
cp -R $MIDDLEMAN_BUILD_DIR/images $PHONEGAP_BUILD_DIR/

# ----------------------------------------------------------------
print_message "Recreating build archive"
rm phonegap_build.zip
zip -r phonegap_build.zip phonegap_build/

