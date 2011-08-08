#!/usr/bin/env ruby

# setting
browser_cmd = 'firefox'
clipboard_cmd = 'xclip'
proxy_addr = nil
proxy_port = nil

require 'net/http'
require 'uri'
require 'base64'
require 'rexml/document'

# capture png file
tmpfile = "/tmp/image_upload#{$$}.png"
imagefile = ARGV[0]

if imagefile && File.exist?(imagefile) then
  system "convert #{imagefile} #{tmpfile}"
else
  system "import #{tmpfile}"
end

if !File.exist?(tmpfile) then
  exit
end

imagedata = Base64.encode64(File.read(tmpfile))
File.delete(tmpfile)

HOST = 'api.imgur.com'

Net::HTTP::Proxy(proxy_addr, proxy_port).start(HOST,80) {|http|
	res = Net::HTTP.post_form(URI.parse('http://api.imgur.com/2/upload'),
		{'image' => imagedata, 'key' => '94ba67d34a5f03445ee8f06aa9844c3e'})
	xml_data = res.body
	doc = REXML::Document.new(xml_data)
	doc.elements.each('upload/links/original') do |ele|
		url = ele.text
		puts url
		system "echo -n #{url} | #{clipboard_cmd}"
		system "#{browser_cmd} #{url}"
	end

}

