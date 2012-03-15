require 'ruble'

# FIXME This is Mac specific!

# 
# Open Document in Running Browser(s)
# 
# Now supports multiple running versions of a single browser along
# with a range of new/old browsers. Bring back support for Firefox.
# 
# Options: Set TM_PROJECT_SITEURL in your TM Project Window Info Button
# in the following form: "http://example.com/"
command t(:open_doc_in_running_browser) do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    require "escape"
    
    if ENV['TM_PROJECT_SITEURL']
      url = "#{ENV['TM_PROJECT_SITEURL']}" + ENV['TM_FILEPATH'].sub(/^#{Regexp.escape(ENV['TM_PROJECT_DIRECTORY'])}\//, '') 
    else
      url = "file://#{ENV['TM_FILEPATH']}"
    end
    
    proclist = `ps -x -o command`
    active = []
    
    browsers = %w[ Safari OmniWeb Camino Shiira firefox-bin Xyle\ scope Opera Internet\ Explorer flock-bin iCab Sunrise seamonkey-bin navigator-bin ].join('|')
    
    # Build paths to each active browser
    #
    # Notes:
    #   - 'WebKit' look ahead is to rule it out so we can use the working
    #      rule below.
    #   - 'LaunchCFMApp' portion is so iCab works.
    active = proclist.scan(%r{^(?:/.*LaunchCFMApp )?(/.*\.app)(?=/Contents/MacOS/(?:#{browsers})\b(?!.*WebKit))})
    
    # Special check for WebKit as it appears as Safari
    # Note: Only supports one running instance of WebKit, picked at random.
    if proclist =~ %r{/Contents/MacOS/Safari.*WebKit}
      active << "WebKit"
    end
    
    # TODO: Change when Leopard Only
    # On Leopard use the -g option to open in background.
    os = `defaults read /System/Library/CoreServices/SystemVersion ProductVersion`
    if os =~ /^10\.(5|6)/
      active.each {|p| `open -g -a #{e_sh(p)} #{e_sh(url)}` }
    else
      active.each {|p| `open -a #{e_sh(p)} #{e_sh(url)}` }
    end
  end
end
