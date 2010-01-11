with_defaults :scope => 'text.html' do |bundle|

snippet 'arrow' do |s|
  s.trigger = 'arrow'
  s.expansion = '&#x2192;'
end

snippet 'backspace' do |s|
  s.trigger = 'backspace'
  s.expansion = '&#x232B;'
end

snippet 'backtab' do |s|
  s.trigger = 'backtab'
  s.expansion = '&#x21E4;'
end

snippet 'command' do |s|
  s.trigger = 'command'
  s.expansion = '&#x2318;'
end

snippet 'control' do |s|
  s.trigger = 'control'
  s.expansion = '&#x2303;'
end

snippet 'delete' do |s|
  s.trigger = 'delete'
  s.expansion = '&#x2326;'
end

snippet 'HTML Ñ 4.01 Strict' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
'
end

snippet 'XHTML Ñ 1.0 Frameset' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
'
end

snippet 'XHTML Ñ 1.0 Strict' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
'
end

snippet 'XHTML Ñ 1.0 Transitional' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
'
end

snippet 'XHTML Ñ 1.1' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
'
end

snippet 'down' do |s|
  s.trigger = 'down'
  s.expansion = '&#x2193;'
end

snippet 'Embed QT Movie' do |s|
  s.trigger = 'movie'
  s.expansion = '<object width="$2" height="$3" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
	<param name="src" value="$1"${TM_XHTML}>
	<param name="controller" value="$4"${TM_XHTML}>
	<param name="autoplay" value="$5"${TM_XHTML}>
	<embed src="${1:movie.mov}"
		width="${2:320}" height="${3:240}"
		controller="${4:true}" autoplay="${5:true}"
		scale="tofit" cache="true"
		pluginspage="http://www.apple.com/quicktime/download/"
	${TM_XHTML}>
</object>'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Emphasize' do |s|
  s.expansion = '${0:${TM_SELECTED_TEXT/\A<em>(.*)<\/em>\z|.*/(?1:$1:<em>$0<\/em>)/m}}'
end

snippet 'enter' do |s|
  s.trigger = 'enter'
  s.expansion = '&#x2305;'
end

snippet 'escape' do |s|
  s.trigger = 'escape'
  s.expansion = '&#x238B;'
end

snippet 'Fieldset' do |s|
  s.trigger = 'fieldset'
  s.expansion = '<fieldset id="${1/[[:alpha:]]+|( )/(?1:_:\L$0)/g}" ${2:class="${3:}"}>
	<legend>${1:$TM_SELECTED_TEXT}</legend>
	
	$0
</fieldset>'
end

snippet 'HTML Ñ 4.01 Transitional' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
'
end

snippet 'IE Conditional Comment: Internet Explorer 5.0 only' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if IE 5.0]>${1:${TM_SELECTED_TEXT:   IE Conditional Comment: Internet Explorer 5.0 only }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: Internet Explorer 5.5 only' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if IE 5.5000]>${1:${TM_SELECTED_TEXT:   IE Conditional Comment: Internet Explorer 5.5 only }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: Internet Explorer 5.x' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if lt IE 6]>${1:${TM_SELECTED_TEXT:  IE Conditional Comment: Internet Explorer 5.x      }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: Internet Explorer 6 and below' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if lte IE 6]>${1:${TM_SELECTED_TEXT: IE Conditional Comment: Internet Explorer 6 and below }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: Internet Explorer 6 only' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if IE 6]>${1:${TM_SELECTED_TEXT:     IE Conditional Comment: Internet Explorer 6 only   }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: Internet Explorer 7 and above' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if gte IE 7]>${1:${TM_SELECTED_TEXT: IE Conditional Comment: Internet Explorer 7 and above }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: Internet Explorer' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if IE]>${1:${TM_SELECTED_TEXT:       IE Conditional Comment: Internet Explorer          }}<![endif]-->$0'
end

snippet 'IE Conditional Comment: NOT Internet Explorer' do |s|
  s.trigger = '!'
  s.expansion = '<!--[if !IE]><!-->${1:${TM_SELECTED_TEXT:  IE Conditional Comment: NOT Internet Explorer      }}<!-- <![endif]-->$0'
end

snippet 'Input with Label' do |s|
  s.trigger = 'input'
  s.expansion = '<label for="${2:${1/[[:alpha:]]+|( )/(?1:_:\L$0)/g}}">$1</label><input type="${3:text/submit/hidden/button}" name="${4:$2}" value="$5"${6: id="${7:$2}"}${TM_XHTML}>
'
end

snippet 'left' do |s|
  s.trigger = 'left'
  s.expansion = '&#x2190;'
end

snippet 'option' do |s|
  s.trigger = 'option'
  s.expansion = '&#x2325;'
end

snippet 'Option' do |s|
  s.trigger = 'opt'
  s.expansion = '<option${1: value="${2:option}"}>${3:$2}</option>'
end

snippet 'return' do |s|
  s.trigger = 'return'
  s.expansion = '&#x21A9;'
end

snippet 'right' do |s|
  s.trigger = 'right'
  s.expansion = '&#x2192;'
end

snippet 'Select Box' do |s|
  s.trigger = 'select'
  s.expansion = '<select name="${1:some_name}" id="${2:$1}"${3:${4: multiple}${5: onchange="${6:}"}${7: size="${8:1}"}}>
	<option${9: value="${10:option1}"}>${11:$10}</option>
	<option${12: value="${13:option2}"}>${14:$13}</option>${15:}
	$0
</select>'
end

snippet 'shift' do |s|
  s.trigger = 'shift'
  s.expansion = '&#x21E7;'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Special: Return Inside Empty Open/Close Tags' do |s|
  s.expansion = '
	$0
'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Strong' do |s|
  s.expansion = '${0:${TM_SELECTED_TEXT/\A<strong>(.*)<\/strong>\z|.*/(?1:$1:<strong>$0<\/strong>)/m}}'
end

snippet 'tab' do |s|
  s.trigger = 'tab'
  s.expansion = '&#x21E5;'
end

snippet 'up' do |s|
  s.trigger = 'up'
  s.expansion = '&#x2191;'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Wrap in <?= ... ?>' do |s|
  s.expansion = 'text.html string'
  s.expansion = '<?= $TM_SELECTED_TEXT ?>'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Wrap Selection in Open/Close Tag' do |s|
  s.expansion = '<${1:p}>$TM_SELECTED_TEXT</${1/\s.*//}>'
end

snippet 'Input' do |s|
  s.trigger = 'input'
  s.expansion = '<input type="${1:text/submit/hidden/button}" name="${2:some_name}" value="$3"${4: id="${5:$2}"}${TM_XHTML}>'
end

snippet 'Text Area' do |s|
  s.trigger = 'textarea'
  s.expansion = '<textarea name="${1:Name}" rows="${2:8}" cols="${3:40}">$0</textarea>'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Non-Breaking Space' do |s|
  s.expansion = '&nbsp;'
end

snippet 'Mail Anchor' do |s|
  s.trigger = 'mailto'
  s.expansion = '<a href="mailto:${1:joe@example.com}?subject=${2:feedback}">${3:email me}</a>'
end

snippet 'Base' do |s|
  s.trigger = 'base'
  s.expansion = '<base href="$1"${2: target="$3"}${TM_XHTML}>'
end

snippet 'Body' do |s|
  s.trigger = 'body'
  s.expansion = '<body id="${1:${TM_FILENAME/(.*)\..*/\L$1/}}"${2: onload="$3"}>
	$0
</body>'
end

# FIXME No tab trigger, probably needs to become command
snippet 'Br' do |s|
  s.expansion = '<br${TM_XHTML}>'
end

snippet 'Div' do |s|
  s.trigger = 'div'
  s.expansion = '<div${1: id="${2:name}"}>
	${0:$TM_SELECTED_TEXT}
</div>'
end

snippet 'Form' do |s|
  s.trigger = 'form'
  s.expansion = '<form action="${1:${TM_FILENAME/(.*?)\..*/$1_submit/}}" method="${2:get}" accept-charset="utf-8">
	$0

	<p><input type="submit" value="Continue &rarr;"${TM_XHTML}></p>
</form>'
end

snippet 'Heading' do |s|
  s.trigger = 'h1'
  s.expansion = '<h1 id="${1/[[:alpha:]]+|( )/(?1:_:\L$0)/g}">${1:$TM_SELECTED_TEXT}</h1>'
end

snippet 'Head' do |s|
  s.trigger = 'head'
  s.expansion = '<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"${TM_XHTML}>
	<title>${1:${TM_FILENAME/((.+)\..*)?/(?2:$2:Page Title)/}}</title>
	$0
</head>'
end

snippet 'Link' do |s|
  s.trigger = 'link'
  s.expansion = '<link rel="${1:stylesheet}" href="${2:/css/master.css}" type="text/css" media="${3:screen}" title="${4:no title}" charset="${5:utf-8}"${TM_XHTML}>'
end

snippet 'Meta' do |s|
  s.trigger = 'meta'
  s.expansion = '<meta name="${1:name}" content="${2:content}"${TM_XHTML}>'
end

snippet 'Script With External Source' do |s|
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
  s.expansion = '<table border="${1:0}"${2: cellspacing="${3:5}" cellpadding="${4:5}"}>
	<tr><th>${5:Header}</th></tr>
	<tr><td>${0:Data}</td></tr>
</table>'
end

snippet 'Title' do |s|
  s.trigger = 'title'
  s.expansion = '<title>${1:${TM_FILENAME/((.+)\..*)?/(?2:$2:Page Title)/}}</title>'
end

end