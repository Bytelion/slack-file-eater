# slack-file-eater
This is a short ruby script to delete files from your slack team.

The files deleted are determined by the token used and the @months set.
The script will only delete files that the token's account can see, and
has permission to delete.

# log into slack at slack.com
# navigate to https://api.slack.com/custom-integrations/legacy-tokens
# make a new legacy token, should start with 'xoxp-'
# enter that token in place of "{YOUR TOKEN GOES HERE}"

# be sure to set the month limit!
 - @months is currently set to 2. This will delete all files older than 2 months.
 - setting @months to 0 will delete all files you have access to.
