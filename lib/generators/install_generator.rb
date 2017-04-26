class InstallGenerator < Rails::Generators::Base
  desc "Creates a GTM on Rails initializer to your application."
  def create_initializer_file
    create_file "config/initializers/initializer.rb", "# イニシャライザの内容をここに記述"
  end
  def create_initializer_file_2
    create_file "config/initializers/initializer_2.rb", "# イニシャライザの内容をここに記述"
  end
end
