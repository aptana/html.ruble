require 'ruble'
require 'uri'

command 'Open Document in Default Browser' do |cmd|
  cmd.key_binding = "M1+M2+P"
  cmd.scope = 'text.html -text.html.ruby'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    if ENV['TM_PROJECT_SITEURL']
      url = "#{ENV['TM_PROJECT_SITEURL']}" + ENV['TM_FILEPATH'].sub(/^#{Regexp.escape(ENV['TM_PROJECT_DIRECTORY'])}\//, '') 
    else
      url = "file:#{URI.escape(ENV['TM_FILEPATH'])}"
    end    
    context.browser.open(url, :browser => :default)
  end
end
