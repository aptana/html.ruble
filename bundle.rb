require 'ruble'

bundle 'HTML' do |bundle|
  bundle.author = "Christopher Williams, ? et al"
  bundle.copyright = <<END
(c) Copyright 2010 Aptana Inc. Distributed under GPLv3 and Aptana Source license.

Portions (c) Copyright 2006, distributed under the terms of the MIT License.
END
  bundle.description = 'Support for HTML, converted from TextMate to Ruble by Aptana.'
  bundle.repository = "git://github.com/aptana/html.ruble.git"
  # Folding
  BLOCK_TAGS = 'body|div|dl|fieldset|form|frame|head|html|li|menu|ol|script|select|style|table|tbody|thead|tfoot|tr|ul'
  start_folding = /(?x)
    (<(?i:#{BLOCK_TAGS})\b.*?>
    |<!--(?!.*--\s*>)
    |^<!--\ \#tminclude\ (?>.*?-->)$
    |<\?(?:php)?.*\b(if|for(each)?|while)\b.+:
    |\{\{?(if|foreach|capture|literal|foreach|php|section|strip)
    |\{\s*($|\?>\s*$|\/\/|\/\*(.*\*\/\s*$|(?!.*?\*\/)))
    )/
  end_folding = /(?x)
    (<\/(?i:#{BLOCK_TAGS})>
    |^(?!.*?<!--).*?--\s*>
    |^<!--\ end\ tminclude\ -->$
    |<\?(?:php)?.*\bend(if|for(each)?|while)\b
    |\{\{?\/(if|foreach|capture|literal|foreach|php|section|strip)
    |^[^{]*\}
    )/
  bundle.folding['text.html'] = start_folding, end_folding
  # Indentation
  increase_indent_pattern = /(?x)
    <(?!\?|area|base|br|col|frame|hr|html|img|input|link|meta|param|[^>]*\/>)
      ([A-Za-z0-9]+)(?=\s|>)\b[^>]*>(?!.*<\/\1>)
    |<!--(?!.*-->)
    |<\?php.+?\b(if|else(?:if)?|for(?:each)?|while)\b.*:(?!.*end\1)
    |\{[^}"']*$/
  decrease_indent_pattern = /(?x)
    ^\s*
    (<\/(?!html)
      [A-Za-z0-9]+\b[^>]*>
    |-->
    |<\?(php)?\s+(else(if)?|end(if|for(each)?|while))
    |\}
    )/
  bundle.indent['text.html'] = increase_indent_pattern, decrease_indent_pattern
  
  # most commands install into a dedicated rails menu
  # See also the alternative, HAML-style syntax in menu.rrmenu
  bundle.menu "HTML" do |menu|
    # this menu should be shown when any of the following scopes is active:
    menu.scope = [ "text.html" ]
    
    menu.command 'Documentation for Tag'
    menu.command 'Validate Syntax (W3C)'
    menu.separator
    menu.command 'Open Document in Internal Browser'
    menu.command 'Open Document in Default Browser'
    menu.command 'Open Document in Running Browser(s)'
    menu.command 'Refresh Running Browser(s)'
    menu.separator
    menu.menu 'Entities' do |entities|
      entities.command 'Convert Character / Selection to Entities'
      entities.command 'Convert Character / Selection to Entities Excl. Tags'
      entities.command 'Decode Entities in Line / Selection'
      entities.separator
      entities.command 'Non-Breaking Space'
      entities.command 'right'
      entities.command 'left'
      entities.command 'backtab'
      entities.command 'enter'
      entities.command 'control'
      entities.command 'delete'
      entities.command 'return'
      entities.command 'tab'
      entities.command 'backspace'
      entities.command 'command'
      entities.command 'down'
      entities.command 'arrow'
      entities.command 'up'
      entities.command 'shift'
      entities.command 'escape'
      entities.command 'option'
      entities.separator
      entities.command 'Insert Entity...'
    end
    menu.menu 'URL Escapes' do |escapes|
      escapes.command 'URL Escape Line / Selection'
      escapes.command 'URL Unescape Line / Selection'
    end
    menu.command 'Encrypt Line / Selection (ROT 13)'
    menu.separator
    menu.command 'Insert Open/Close Tag (With Current Word)'
    menu.command 'Insert Close Tag'
    menu.menu 'Insert DocType' do |doctype|
      doctype.command 'HTML - 4.01 Strict'
      doctype.command 'HTML - 4.01 Transitional'
      doctype.separator
      doctype.command 'XHTML - 1.0 Frameset'
      doctype.command 'XHTML - 1.0 Strict'
      doctype.command 'XHTML - 1.0 Transitional'
      doctype.command 'XHTML - 1.1'
    end
    menu.separator
    menu.menu 'Includes' do |includes|
      includes.command 'Add Persistent Include'
      includes.command 'Update Document'
      includes.command 'Help: Persistent Includes'
    end
    menu.menu 'Format' do |format|
      format.command 'Strong'
      format.command 'Emphasize'
    end
    menu.menu 'Conditional Comments' do |comments|
      comments.command 'IE Conditional Comment: Internet Explorer 5.0 only'
      comments.command 'IE Conditional Comment: Internet Explorer 5.5 only'
      comments.command 'IE Conditional Comment: Internet Explorer 5.x'
      comments.command 'IE Conditional Comment: Internet Explorer 6 and below'
      comments.command 'IE Conditional Comment: Internet Explorer 6 only'
      comments.command 'IE Conditional Comment: Internet Explorer 7 and above'
      comments.command 'IE Conditional Comment: Internet Explorer'
      comments.command 'IE Conditional Comment: NOT Internet Explorer'
    end
    menu.separator
    menu.command 'Wrap Selection in Open/Close Tag'
    menu.command 'Wrap Each Selected Line in Open/Close Tag'
    menu.command 'Wrap in <?= ... ?>'
    menu.separator
    menu.command 'Strip HTML Tags from Document / Selection'
    menu.command 'Tidy'
  end
end
