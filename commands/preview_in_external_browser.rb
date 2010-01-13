require 'radrails'
require 'rbconfig'

command 'Open Document in Default Browser' do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    if ENV['TM_PROJECT_SITEURL']
      url = "#{ENV['TM_PROJECT_SITEURL']}" + ENV['TM_FILEPATH'].sub(/^#{Regexp.escape(ENV['TM_PROJECT_DIRECTORY'])}\//, '') 
    else
      url = "file://#{ENV['TM_FILEPATH']}"
    end
    test_os = ::Config::CONFIG['host_os']
    case test_os
    when /mingw/i, /mswin/i, /windows/i
      family = :windows
    when /darwin/i, /mac os/i
      family = :darwin
    when /solaris/i, /bsd/i, /linux/i, /aix/i
      family = :nix
    when /cygwin/i
      family = :cygwin
    else
      family = :unknown
    end
    # Now launch based on OS
    case family
    when :darwin, :cygwin
      `open "#{url}"`
    when :windows
      `start "#{url}"`
    else
      `xdg-open "#{url}"`
    end
  end
end
