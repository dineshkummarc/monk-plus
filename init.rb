$:.unshift(*Dir["./vendor/*/lib"])

begin
  require "rubygems"  if RUBY_VERSION < "1.9"
  gem 'sinatra', '~> 1.1'
  gem 'haml', '~> 3.0'
  require "sinatra/base"
  require "rtopia"
  require "sinatra/content_for"
  require "jsfiles"
  require "user_agent"
rescue LoadError => e
  $stderr.write "Not all gems were able to load. (#{e.message.strip})\n"
  $stderr.write "Do `monk install` first, or install the gems in .gems yourself.\n"
  exit
end

class Main < Sinatra::Base
  set      :root, lambda { |*args| File.join(File.dirname(__FILE__), *args) }
  set      :views, root('app', 'views')

  enable   :raise_errors, :sessions, :logging,
           :show_exceptions, :raise_errors

  use      Rack::Session::Cookie
  helpers  Rtopia
  helpers  Sinatra::ContentFor        # sinatra-content_for
  helpers  Sinatra::UserAgentHelpers  # agentsniff

  # Load all, but load defaults first
  Dir[root('config', '{*.defaults,*}.rb')].uniq.each { |f| load f }

  configure :development do
    require 'pistol'
    use Pistol, Dir["./{lib,app}/**/*.rb"] { reset! and load(__FILE__) }
  end
end

Dir["./{lib,app/**}/*.rb"].each { |rb| require rb }

Main.set :port, ENV['PORT'].to_i  unless ENV['PORT'].nil?
Main.run!  if __FILE__ == $0
