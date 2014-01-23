# setting
require 'net/http'
require 'uri'
require 'base64'
require 'rexml/document'

proxy_addr = nil
proxy_port = nil

# Setting up variables
imagedata = nil

# Getting file from form
tmpfile = params[:file]

# Getting file name
name = tmpfile.original_filename

# Temporary upload path
directory = "public/images/upload"
path = File.join(directory, name)

# Read binary and Base64 Encode
File.open(tmpfile.tempfile.path, "rb") do |file|
  imagedata = Base64.encode64 file.read
end

host = 'api.imgur.com'
api_key = 'YOUR_API_KEY'

Net::HTTP::Proxy(proxy_addr, proxy_port).start(host,80) {|http|
  res = Net::HTTP.post_form(URI.parse('http://api.imgur.com/2/upload'), {'image' => imagedata, 'key' => api_key})
  xml_data = res.body
  doc = REXML::Document.new(xml_data)
  doc.elements.each('upload/links/original') do |element|
    @url = element.text
    respond_to do |format|
      if @url
        format.js
      else
        format.js
      end
    end

  end
}
