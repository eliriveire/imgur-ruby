require "imgurruby/version"
require 'net/http'
require 'uri'
require 'base64'
require 'rexml/document'

module Imgurruby
	attr_accessor :api_key, :host, :proxy_addr, :proxy_port, :url, :msg
	class Imgur
		def initialize(key, addr = nil, port = nil)
			@api_key = key
			@host = 'api.imgur.com'
			@proxy_addr = addr
			@proxy_port = port
		end

		def upload(file)
			# Image Data Variable
			imagedata = nil

			# Temp File
			tmpfile = file

			# File Name
			file_name = tmpfile.original_filename

			# Read File Binary
			File.open(tmpfile.tempfile.path, "rb") do |file|
				# Base64 Encode Image Data
				imagedata = Base64.encode64 file.read
			end

			# Begin file upload
			Net::HTTP::Proxy(@proxy_addr, @proxy_port).start(@host,80) {|http|
				res = Net::HTTP.post_form(URI.parse('http://api.imgur.com/2/upload'), {'image' => imagedata, 'key' => @api_key})
				xml_data = res.body
				doc = REXML::Document.new(xml_data)
				doc.elements.each('*/message') do |element|
					@msg = element.text
				end			
				doc.elements.each('upload/links/original') do |element|
					@url = element.text
				end
			}
		end

		# Return msg or url
		def url
			if @msg
				@msg
			else
				@url
			end
		end
	end
end
