require 'rubygems'
require 'google/api_client'
require 'google_drive'

# Authorizes with OAuth and gets an access token
client = Google::APIClient.new
auth = client.authorization
auth.client_id = "518483011569-uvpm2r839e9r0jfu1t9sav2q4dartcah.apps.googleusercontent.com"
auth.client_secret = "k9jrRmlIvdGoscKoDIzsrxTz"
auth.scope =
    "https://www.googleapis.com/auth/drive " +
    "https://spreadsheets.google.com/feeds/"
auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
print("2. Enter the authorization code shown in the page: ")
auth.code = $stdin.gets.chomp
auth.fetch_access_token!
access_token = auth.access_token

# Creates a session.
session = GoogleDrive.login_with_oauth(access_token)

# Gets list of remote files.
for file in session.files
  p file.title
end

# Uploads a local file.
session.upload_from_file("/path/to/hello.txt", "hello.txt", :convert => false)

# Downloads to a local file.
file = session.file_by_title("hello.txt")
file.download_to_file("/path/to/hello.txt")

# Updates content of the remote file.
file.update_from_file("/path/to/hello.txt")