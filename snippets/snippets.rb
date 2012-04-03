require 'ruble'

with_defaults :scope => 'text.html - (source | string)' do |bundle|

command t(:quick_br) do |cmd|
  cmd.key_binding = 'M1+ENTER'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke { "<br />" }
end

command t(:quick_html_space) do |cmd|
  cmd.key_binding = 'M1+M2+SPACE'
  cmd.output = :insert_as_snippet
  cmd.input = :none
  cmd.invoke { "&nbsp;" }
end

snippet t(:arrow) do |s|
  s.trigger = 'arrow'
  s.expansion = '&#x2192;'
end

snippet t(:backspace) do |s|
  s.trigger = 'backspace'
  s.expansion = '&#x232B;'
end

snippet t(:backtab) do |s|
  s.trigger = 'backtab'
  s.expansion = '&#x21E4;'
end

snippet t(:command) do |s|
  s.trigger = 'command'
  s.expansion = '&#x2318;'
end

snippet t(:control) do |s|
  s.trigger = 'control'
  s.expansion = '&#x2303;'
end

snippet t(:delete) do |s|
  s.trigger = 'delete'
  s.expansion = '&#x2326;'
end

snippet t(:html_4_strict) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
'
end

snippet t(:xhtml_1_frameset) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
'
end

snippet t(:xhtml_1_strict) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
'
end

snippet t(:xhtml_1_transitional) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
'
end

snippet t(:xhtml_11) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
'
end

snippet t(:down) do |s|
  s.trigger = 'down'
  s.expansion = '&#x2193;'
end

snippet t(:embed_qt_movie) do |s|
  s.trigger = 'movie'
  s.expansion = '<object width="${2:320}" height="${3:240}" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
	<param name="src" value="${1:movie.mov}"/>
	<param name="controller" value="${4:true}"/>
	<param name="autoplay" value="${5:true}"/>
	<embed src="${1:movie.mov}"
		width="${2:320}" height="${3:240}"
		controller="${4:true}" autoplay="${5:true}"
		scale="tofit" cache="true"
		pluginspage="http://www.apple.com/quicktime/download/"
	/>
</object>'
end

snippet t(:enter) do |s|
  s.trigger = 'enter'
  s.expansion = '&#x2305;'
end

snippet t(:escape) do |s|
  s.trigger = 'escape'
  s.expansion = '&#x238B;'
end

snippet t(:html_4_transitional) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
'
end

snippet 'Input with Label' do |s|
  s.trigger = 'input'
  s.expansion = '<label for="$2">$1</label><input type="${3:text/submit/hidden/button}" name="$2" value="$5" id="$2"/>
'
end

snippet t(:left) do |s|
  s.trigger = 'left'
  s.expansion = '&#x2190;'
end

snippet t(:option) do |s|
  s.trigger = 'option'
  s.expansion = '&#x2325;'
end

snippet t(:option) do |s|
  s.trigger = 'opt'
  s.expansion = '<option value="${1:option}">${1:option}</option>'
end

snippet t(:return) do |s|
  s.trigger = 'return'
  s.expansion = '&#x21A9;'
end

snippet t(:right) do |s|
  s.trigger = 'right'
  s.expansion = '&#x2192;'
end
# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'Select Box' do |s|
  # s.trigger = 'select'
  # s.expansion = '<select name="${1:some_name}" id="${2:$1}"${3:${4: multiple}${5: onchange="${6:}"}${7: size="${8:1}"}}>
	# <option${9: value="${10:option1}"}>${11:$10}</option>
	# <option${12: value="${13:option2}"}>${14:$13}</option>${15:}
	# $0
# </select>'
# end

snippet t(:shift) do |s|
  s.trigger = 'shift'
  s.expansion = '&#x21E7;'
end

# FIXME No tab trigger, probably needs to become command
# snippet 'Special: Return Inside Empty Open/Close Tags' do |s|
  # s.expansion = '
	# $0
# '
# end

snippet t(:tab) do |s|
  s.trigger = 'tab'
  s.expansion = '&#x21E5;'
end

snippet t(:up) do |s|
  s.trigger = 'up'
  s.expansion = '&#x2191;'
end

snippet 'Input' do |s|
  s.trigger = 'input'
  s.expansion = '<input type="${1:text/submit/hidden/button}" name="${2:some_name}" value="$3" id="${2:some_name}"/>'
end

snippet 'Text Area' do |s|
  s.trigger = 'textarea'
  s.expansion = '<textarea name="${1:Name}" rows="${2:8}" cols="${3:40}">$0</textarea>'
end

snippet t(:nbsp) do |s|
  s.key_binding = 'OPTION+Space'
  s.expansion = '&nbsp;'
end

snippet t(:mail_anchor) do |s|
  s.trigger = 'mailto'
  s.expansion = '<a href="mailto:${1:joe@example.com}?subject=${2:feedback}">${3:email me}</a>'
end

snippet 'Base' do |s|
  s.trigger = 'base'
  s.expansion = '<base href="$1" target="$2"/>'
end

snippet 'Br' do |s|
  s.key_binding = 'CONTROL+ENTER'
  s.expansion = '<br/>'
end

snippet 'Link' do |s|
  s.trigger = 'link'
  s.expansion = '<link rel="${1:stylesheet}" href="${2:/css/master.css}" type="text/css" media="${3:screen}" title="${4:no title}" charset="${5:utf-8}"/>'
end

snippet 'Meta' do |s|
  s.trigger = 'meta'
  s.expansion = '<meta name="${1:name}" content="${2:content}"/>'
end

snippet t(:script_w_external_source) do |s|
  s.trigger = 'scriptsrc'
  s.expansion = '<script src="$1" type="text/javascript" charset="${3:utf-8}"></script>'
end

snippet 'Script' do |s|
  s.trigger = 'script'
  s.expansion = '<script type="text/javascript" charset="utf-8">
	$0
</script>'
end

snippet 'Style' do |s|
  s.trigger = 'style'
  s.expansion = '<style type="text/css" media="screen">
	$0
</style>'
end

snippet 'Table' do |s|
  s.trigger = 'table'
  s.expansion = '<table border="${1:0}" cellspacing="${2:5}" cellpadding="${3:5}">
	<tr><th>${4:Header}</th></tr>
	<tr><td>${5:Data}</td></tr>
</table>'
end

end # End Snippets with scope 'text.html'

# -----------------------------------------------------------------------------------
# Snippets that used env vars and needed to be converted to commands
with_defaults :scope => 'text.html - source', :input => :none, :output => :insert_as_snippet do |bundle|

  command t(:emphasize) do |cmd|
    cmd.key_binding = 'M1+M2+I'
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<em>${1:#{selection}}</em>"
      else
        "<em>$0</em>"
      end
    end
  end
  
  command 'Fieldset' do |cmd|
    cmd.trigger = 'fieldset'
    cmd.invoke do |context|
      selection = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : 'legend'
"<fieldset id=\"$2\" class=\"$3\">
  <legend>${1:#{selection}}</legend>
  
  $0
</fieldset>"
    end
  end
  
  command t(:ie_5) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '   IE Conditional Comment: Internet Explorer 5.0 only '
      "<!--[if IE 5.0]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_55) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '   IE Conditional Comment: Internet Explorer 5.5 only '
      "<!--[if IE 5.5000]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_5x) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '  IE Conditional Comment: Internet Explorer 5.x      '
      "<!--[if lt IE 6]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_6_and_below) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : ' IE Conditional Comment: Internet Explorer 6 and below '
      "<!--[if lte IE 6]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_6) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '     IE Conditional Comment: Internet Explorer 6 only   '
      "<!--[if IE 6]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_7_and_above) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : ' IE Conditional Comment: Internet Explorer 7 and above '
      "<!--[if gte IE 7]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '       IE Conditional Comment: Internet Explorer          '
      "<!--[if IE]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:not_ie) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '  IE Conditional Comment: NOT Internet Explorer      '
      "<!--[if !IE]><!-->${1:#{value}}<!-- <![endif]-->$0"
    end
  end
  
  command t(:strong) do |cmd|
    cmd.key_binding = 'M1+M2+B'
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<strong>${1:#{selection}}</strong>"
      else
        "<strong>$0</strong>"
      end
    end
  end
  
  command t(:wrap_in_jsp_tag) do |cmd|
    cmd.scope = 'text.html string'
    cmd.invoke {|context| "<?= #{ENV['TM_SELECTED_TEXT']} ?>" }
  end
  
  command t(:wrap_selection_in_tag_pair) do |cmd|
    cmd.key_binding = "CONTROL+SHIFT+W"
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<${1:p}>${2:#{selection.gsub('/', '\/')}}</${1:p}>"
      else
        "<${1:p}>$0</${1:p}>"
      end
    end
  end
  
  command 'Body' do |cmd|
    cmd.trigger = 'body'
    cmd.invoke do |context|
      filename = ENV['TM_FILENAME'] || ''
      filename.gsub!(/(.*)\..*/, '\1')
      filename = filename[0,1].downcase + filename[1..-1]
"<body id=\"${1:#{filename}}\" onload=\"$2\">
  $0
</body>"
    end
  end

  command 'Div' do |cmd|
    cmd.trigger = 'div'
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
       if selection.length > 0
"<div id=\"${1:name}\">
  ${2:#{selection}}
</div>"
      else
"<div id=\"${1:name}\">
  $0
</div>"        
      end
    end
  end

  command 'Form' do |cmd|
    cmd.trigger = 'form'
    cmd.invoke do |context|
      filename = ENV['TM_FILENAME'] || ''
      filename.gsub!(/(.*?)\..*/, '\1_submit')
"<form action=\"${1:#{filename}}\" method=\"${2:get}\" accept-charset=\"utf-8\">
  $0

  <p><input type=\"submit\" value=\"Continue &rarr;\"/></p>
</form>"
    end
  end

  command t(:heading) do |cmd|
    cmd.trigger = 'h1'
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<h1 id=\"$2\">${1:#{selection}}</h1>"
      else
        "<h1 id=\"$1\">$0</h1>"
      end
    end
  end

  command 'Head' do |cmd|
    cmd.trigger = 'head'
    cmd.invoke do |context|
      filename = ENV['TM_FILENAME'] || ''
      filename.gsub!(/((.+)\..*)?/, '\2')
"<head>
  <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\"/>
  <title>${1:#{filename}}</title>
  $0
</head>"
    end
  end

  command 'Title' do |cmd|
    cmd.trigger = 'title'
    cmd.invoke do |context|
      filename = ENV['TM_FILENAME'] || ''
      filename.gsub!(/((.+)\..*)?/, '\2')
      "<title>${1:#{filename}}</title>"
    end
  end
end