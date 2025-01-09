#!/bin/bash

# Parameters passed to the script
APP_IDENTIFIER=$1
APPLE_ID=$2
ITC_TEAM_ID=$3
DEV_TEAM_ID=$4

# Path to the Appfile
APPFILE_PATH="./Appfile"

# Generate the Appfile content dynamically
cat <<EOF > $APPFILE_PATH
# For more information about the Appfile, see:
#     https://docs.fastlane.tools/advanced/#appfile
app_identifier("$APP_IDENTIFIER") # The bundle identifier of your app
apple_id("$APPLE_ID") # Your Apple Developer Portal username
itc_team_id("$ITC_TEAM_ID") # App Store Connect Team ID
team_id("$DEV_TEAM_ID") # Developer Portal Team ID
EOF

echo "Appfile updated successfully with the following values:"
echo "  app_identifier: $APP_IDENTIFIER"
echo "  apple_id: $APPLE_ID"
echo "  itc_team_id: $ITC_TEAM_ID"
echo "  team_id: $DEV_TEAM_ID"