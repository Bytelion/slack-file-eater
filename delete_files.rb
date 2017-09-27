require 'net/http'
require 'json'
require 'uri'

# log into slack at slack.com
# navigate to https://api.slack.com/custom-integrations/legacy-tokens
# make a new legacy token, should start with xoxp-
# enter that token in place of <YOUR TOKEN GOES HERE>
# uncomment the line at the end to delete the files or run it without
# uncommenting it for a dry run.

# wont work without your token
@token = '{YOUR TOKEN GOES HERE} '

# keep files newer than @months old, 0 will delete everything
@months = 2

def get_file_list
ts_to = (Time.now - (@months * 30 * 24 * 60 * 60)).to_i
params = {
  token: @token,
  ts_to: ts_to,
  count: 500
}
uri = URI.parse('https://slack.com/api/files.list')
uri.query = URI.encode_www_form(params)
response = Net::HTTP.get_response(uri)
JSON.parse(response.body)['files']
end

def delete_files(file_id_list)

  file_id_list.each do |id|
    params = {
      token: @token,
      file: id
    }
    uri = URI.parse('https://slack.com/api/files.delete')
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    p "goodbye: id = #{id}: status = #{JSON.parse(response.body)['ok']}"
  end
end

files = get_file_list
# p files
sizes = files.map { |file| file['size'] }
# p sizes
total_size = sizes.reduce(0, :+)
p total_size / 1024.0 / 1024.0 / 1024.0

# this just collects a list of file ids to delete
ids = files.map { |file| file['id']}
delete_files(ids)
p 'done'
