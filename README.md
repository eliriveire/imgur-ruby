# Imgur Ruby

Based on [Cubee's imgur-ruby](https://github.com/cubeee/imgur-ruby) script.

## Installation

Add this line to your application's Gemfile

    gem "imgurruby", "~> 0.0.2"

For the latest version:

    gem "imgurruby", :git => 'https://github.com/asithade/imgur-ruby'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install imgurruby

## Usage

    @image = Imgurruby::Imgur.new('YOUR_API_KEY')
    @image.upload(params[:file])
    
You can then access the url/error by calling

    @image.url
    

## Contributing

I'm quite a newbie with Ruby, so feel free to add your own insight! 

1. Fork it ( http://github.com/<my-github-username>/imgurruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
