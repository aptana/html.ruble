require 'radrails'

# its ruby, so this just addscommands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
bundle 'HTML' do |bundle|
  bundle.author = "Christopher Williams, ? et al"
  bundle.copyright = <<END
(c) Copyright 2010 Aptana Inc. Distributed under GPLv3 and Aptana Source license.

Portions (c) Copyright 2006, distributed under the terms of the MIT License.
END
  bundle.description = 'Support for HTML, converted from TextMate to RadRails by Aptana.'
  bundle.repository = "git@github.com:aptana/html-rrbundle.git"

  # most commands install into a dedicated rails menu
  # See also the alternative, HAML-style syntax in menu.rrmenu
  bundle.menu "HTML" do |menu|
    # this menu should be shown when any of the following scopes is active:
    menu.scope = [ "text.html" ]
    
#    menu.command 'Documentation for Tag'
#    menu.command 'Validate Syntax (W3C)'
#    menu.separator
#    menu.command 'Open Document in Running Browser(s)'
#    menu.command 'Refresh Running Browser(s)'
#    menu.separator
    menu.command 'Encrypt Line / Selection (ROT 13)'
    menu.separator
    menu.command 'Insert Open/Close Tag (With Current Word)'
#    menu.separator
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
    menu.command 'Wrap in <?= ... ?>'
#    menu.separator
  end
end
