# GTMonRails
GTMonRails enables you to integrate Google Tag Manager easy with Rails application.

GTMonRails not only embed Google Tag Manager snippet, but simply operate and send JavaScript's variable 'dataLayer' for GTM in Ruby code.

GTMonRails basically can't be used only this, you have to set up Tag and Trigger on Google Tag Manager.

*Read this in other languages: [日本語](README.ja.md)*

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'gtm_on_rails'
```

And then execute:
```bash
$ bundle
```

And then run initial settings:
```bash
$ rails g gtm_on_rails:install
```

## Configure
Edit the `/config/initializers/gtm_on_rails.rb` file and customize following settings.
#### container_id
Set your Google Tag Manager container ID.
#### data_layer_limit_byte_size
DataLayer is limited by bytesize at once post. If post size is over this bytesize, exception occured.
#### send_controller_and_action_in_data_layer
Settings that send google tag manager controller and action name by dataLayer.
Be careful using this, if you enable this option, controller and action name output in html source code.
#### rescue_when_error_occurred
If somthing error occurred when output tags, subsequent tag's output is stopped and run subsequent processing.
The point is, dataLayer error won't affect displaying website, if you enable this option.

## Usage
#### Basic
You only push Hash object in `data_layer` variable, can send values what you want by dataLayer.
Usually I’d say you write like the following code in contoller.

```ruby
data_layer.push({
  name: 'name'
})
```
Configure the variable and so on Google Tag Manager when use sended values.

#### `GtmOnRails::DataLayerObject`
```ruby
object = GtmOnRails::DataLayerObject.new({name: 'name'})
data_layer.push(object)
```
You also can use `GtmOnRails::DataLayerObject` object rather than Hash as the above.

```ruby
object = GtmOnRails::DataLayerObject.new({name: 'name'})
object.name
object.name = 'name2'
```
You can access values with `GtmOnRails::DataLayerObject` object as the above.

#### `GtmOnRails::DataLayerEvent`
```ruby
event = GtmOnRails::DataLayerEvent.new('event_name', {name: 'name'})
data_layer.push(event)
```
You can send dataLayer with Google Tag Manager's event name, when write like the above code.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Author
[ykogure](https://github.com/ykogure)
