#!/bin/bash

# Parameters passed to the script
GIT_URL=$1
STORAGE_MODE=$2
TYPE=$3
APP_IDENTIFIER=$4
USERNAME=$5
TEAM_ID=$6
READONLY=$7
VERBOSE=$8

# Path to the Matchfile
MATCHFILE_PATH="./Matchfile"

# Generate the Matchfile content dynamically
cat <<EOF > $MATCHFILE_PATH
# Match configuration file
# For more information, see:
#     https://docs.fastlane.tools/actions/match/

git_url("$GIT_URL")
storage_mode("$STORAGE_MODE")
type("$TYPE") # The default type, can be: appstore, adhoc, enterprise or development
app_identifier(["$APP_IDENTIFIER"])
username("$USERNAME") # Your Apple Developer Portal username
team_id("$TEAM_ID") # Developer Portal Team ID
readonly($READONLY)
verbose($VERBOSE)
EOF

echo "Matchfile updated successfully with the following values:"
echo "  git_url: $GIT_URL"
echo "  storage_mode: $STORAGE_MODE"
echo "  type: $TYPE"
echo "  app_identifier: $APP_IDENTIFIER"
echo "  username: $USERNAME"
echo "  team_id: $TEAM_ID"
echo "  readonly: $READONLY"
echo "  verbose: $VERBOSE"