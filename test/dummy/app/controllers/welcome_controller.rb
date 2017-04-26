class WelcomeController < ApplicationController
  def index
    data_layer.push({test: :test})
  end
end
