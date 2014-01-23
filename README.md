#imgur-ruby

Originally based on the ruby version of [cubeee's imgur-ruby.](https://github.com/cubeee/imgur-ruby)

Upload images to imgur through Rails or Ruby. 

#### Ruby code
Change line *29* to your API Key obtained from [Imgur API](https://api.imgur.com)
```ruby
api_key = 'YOUR_API_KEY'
```

####HTML Code
```html
<form action='/path/to/imgur.rb' enctype='multipart/form-data' method='post' >
	<input type='file' name='file' id='file'>
	<input type='submit' value='Upload'>
</form>
```
