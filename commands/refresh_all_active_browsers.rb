require 'ruble'

# FIXME This is Mac specific and doesn't seem to encompass the same set of browsers as the Preview command 
# (which can handle WebKit, this ends up thinking it's Safari and will launch Safari in a new window when WebKit is open!)
command t(:refresh_running_browsers) do |cmd|
  #cmd.key_binding = 'M1+M2+R'
  cmd.scope = 'text.html, source.css'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke =<<-EOF
###	Refresh All Active Browsers - OmniWeb, Safari, Firefox & IE
### v1.0. 2005-03-29
###

# Check if Internet Explorer is running, if so refresh
ps -xc|grep -sq "Internet Explorer" && osascript -e 'tell app "Internet Explorer"' -e 'activate' -e 'OpenURL "JavaScript:window.location.reload();" toWindow -1' -e 'end tell'

# Check if OmniWeb is running, if so refresh
ps -xc|grep -sq OmniWeb && osascript -e 'tell app "OmniWeb"' -e 'activate' -e 'reload first browser' -e 'end tell'

# Check if Firefox is running, if so refresh
ps -xc|grep -sqi firefox && osascript <<'APPLESCRIPT'
   tell app "Firefox" to activate
   tell app "System Events"
      if UI elements enabled then
         keystroke "r" using command down
         -- Fails if System Preferences > Universal access > "Enable access for assistive devices" is not on 
      else
         tell app "Firefox" to Get URL "JavaScript:window.location.reload();" inside window 1
         -- Fails if Firefox is set to open URLs from external apps in new tabs.
      end if
   end tell
APPLESCRIPT

# Check if Safari is running, if so refresh
ps -xc|grep -sq Safari && osascript -e 'tell app "Safari"' -e 'activate' -e 'do JavaScript "window.location.reload();" in first document' -e 'end tell'

# Check if Camino is running, if so refresh 
ps -xc|grep -sq Camino && osascript -e 'tell app "Camino"' -e 'activate' -e 'tell app "System Events" to keystroke "r" using {command down}' -e 'end tell'

EOF
end
