unless Object.const_defined?(:Picnic)
  $APP_NAME ||= 'rubycas-server'
  $APP_ROOT ||= File.expand_path(File.dirname(__FILE__)+'/..')

  if File.exists?(picnic = File.expand_path(File.dirname(File.expand_path(__FILE__))+'/../../vendor/picnic/lib'))
    $: << picnic
  elsif File.exists?(picnic = File.expand_path(File.dirname(File.expand_path(__FILE__))+'/../../../picnic/lib'))
    $: << picnic
  else
    require 'rubygems'

    # make things backwards-compatible for rubygems < 0.9.0
    if respond_to?(:require_gem)
      puts "WARNING: aliasing gem to require_gem in #{__FILE__} -- you should update your RubyGems system!"
      alias gem require_gem
    end

    gem 'picnic'
  end

  require 'picnic'
end
