require 'test_helper'

class DataLayerTest < ActiveSupport::TestCase
  test '#push given args as Hash' do
    data_layer = GtmOnRails::DataLayer.new

    args = { a: 1, b: 2 }
    data_layer.push(args)

    expect = args
    actual = data_layer.objects.first.data
    assert(expect, actual)
  end

  test '#push given args as DataLayer::Object' do
    data_layer = GtmOnRails::DataLayer.new

    args = GtmOnRails::DataLayer::Object.new(**{ a: 1, b: 2 })
    data_layer.push(args)

    expect = args
    actual = data_layer.objects.first
    assert(expect, actual)
  end

  test '#push given options that before_page_view is true' do
    data_layer = GtmOnRails::DataLayer.new

    args = { a: 1, b: 2 }
    options = { before_page_view: true }
    data_layer.push(args, **options)

    expect = []
    actual = data_layer.objects
    assert(expect, actual)

    expect = args
    actual = data_layer.objects_before_page_view.first
    assert(expect, actual)
  end

  test '#to_js correct converting to javascript' do
    data_layer = GtmOnRails::DataLayer.new

    args = { a: 1, b: 2 }
    data_layer.push(args)

    expect = "var dataLayer = dataLayer || [];dataLayer.push({\"a\":1,\"b\":2});"
    actual = data_layer.to_js
    assert_equal(expect, actual)
  end
end
