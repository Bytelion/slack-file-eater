# slack-file-eater

### Overview
This is a short Ruby script that deletes files from your slack team.

The files to be deleted are determined by the token used and the number of months specified.  The script will only delete files that the token's account can see, and has permission to delete.

### Process
1. Using the steps detailed below, fetch your Slack Legacy token
2. Enter that token in place of {YOUR TOKEN GOES HERE} in **delete_files.rb**
3. Specify a number of months to keep files by updating **@months** in **delete_files.rb** (default is 2; a 0 value will delete all files)
4. Run **delete_files.rb** for each desired user

###### Getting the Slack Legacy Token
1. Log into [Slack](https://slack.com/signin)
2. Navigate to the [Legacy Tokens page](https://api.slack.com/custom-integrations/legacy-tokens)
3. Create a new legacy token (this should start with 'xoxp-')
