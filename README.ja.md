# GTMonRails
GTMonRailsは、RubyOnRailsを使う際にGoogleTagManagerとの連携を簡単に行う事をできるようにするRails用のGemです。

GTMの設置タグを出力するだけでなく、主にJavaScriptを使って行うdataLayer変数の操作や送信をRubyのコード側で行うことができます。

このGemは基本的には単品では機能しません。GoogleTagManager側での設定と合わせて使用して下さい。

*Read this in other languages: [English](README.md)*

## Installation
Gemfileに以下を追記して、追加して下さい。

```ruby
gem 'gtm_on_rails'
```

そしてbundle installを行って下さい。
```bash
$ bundle
```

最後に以下のコマンドを実行して初期設定を行って下さい。
```bash
$ rails g gtm_on_rails:install
```

## Configure
インストールで追加された`/config/initializers/gtm_on_rails.rb`の内容を変更することによって設定を変更して下さい。
#### container_id
GoogleTagManagerのコンテナIDを設定して下さい。
#### data_layer_limit_byte_size
dataLayerには一度にPOSTできる容量に制限があります。GTMonRailsでは、dataLayerに設定された値がここで設定したバイト数を超えた場合、エラーを返します。
#### send_controller_and_action_in_data_layer
この設定を有効にすることによって、dataLayerにRailsのcontroller名とaction名を自動で追加して送信し、GoogleTagManager側で使用することができます。
controller名とaction名はJavaScriptのコードとしてHTMLのソースコード内に出力されるので、その点を留意して下さい。
#### rescue_when_error_occurred
この設定を有効にすることによって、JavaScriptのコードとして出力される際に、dataLayerに設定した値などの問題でエラーが発生場合にエラーを握りつぶします。
つまり、計測周りのエラーによってサイトの表示に影響が出ないようにします。

## Usage
#### 基本
`data_layer`という変数(正確にはhelperが呼び出す変数@gtm_on_rails_data_layer)にdataLayerで送信したい内容をHash型で追加するだけでdataLayerで好きな値を送信できます。
controller内等で以下のように記述する感じになると思います。

```ruby
data_layer.push({
  name: 'name'
})
```

送信したdataLayerの内容は、GoogleTagManager側で変数に設定する等して使用して下さい。

#### `GtmOnRails::DataLayerObject`
```ruby
object = GtmOnRails::DataLayerObject.new({name: 'name'})
data_layer.push(object)
```
Hash形式ではなく、上記のように`GtmOnRails::DataLayerObject`クラスを用いることもできます。

```ruby
object = GtmOnRails::DataLayerObject.new({name: 'name'})
object.name
object.name = 'name2'
```
`GtmOnRails::DataLayerObject`クラスでは、上記のように値にアクセスできます。


#### `GtmOnRails::DataLayerEvent`
```ruby
event = GtmOnRails::DataLayerEvent.new('イベント名', {name: 'name'})
data_layer.push(event)
```
上記のように記述することで、イベント名を設定して送信できます。


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Author
[ykogure](https://github.com/ykogure)
