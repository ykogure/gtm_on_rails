class WelcomeController < ApplicationController
  def index
    data_layer.push({test: 'after_page_view'})
    data_layer.push({test: 'before_page_view'}, before_page_view: true)
  end
end
