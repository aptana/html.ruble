require 'ruble'
    
command t(:convert_to_entities_excluding_tags) do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :character
  cmd.invoke do |context|
    $KCODE = 'U'
    require 'encode'
    
    str = ''
    $stdin.read.scan(/(?x)
    
        ( <\?(?:[^?]*|\?(?!>))*\?>
        | <!-- (?m:.*?) -->
        | <\/? (?i:a|abbr|acronym|address|applet|area|b|base|basefont|bdo|big|blockquote|body|br|button|caption|center|cite|code|col|colgroup|dd|del|dfn|dir|div|dl|dt|em|fieldset|font|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|hr|html|i|iframe|img|input|ins|isindex|kbd|label|legend|li|link|map|menu|meta|noframes|noscript|object|ol|optgroup|option|p|param|pre|q|s|samp|script|select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|ul|var)\b
            (?:[^>"']|"[^"]*"|'[^']*')*
          >
        | &(?:[a-zA-Z0-9]+|\#[0-9]+|\#x[0-9a-fA-F]+);
        )
        |([^<&]+|[<&])
    
      /x) do |tag, text|
      str << tag.to_s
      str << encode(text.to_s)
    end
    str
  end
end
