require 'ruble'

command t(:insert_tag_pair) do |cmd|
  cmd.key_binding = 'CONTROL+M2+,'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :word
  cmd.invoke do |context|
    # This script will expand the current word into: <word></word>
    # It will recognize HTML 4.0 tags that need no close tag.
    #
    # With no current word, it will insert: <p></p> and allows you
    # to overwrite the tag name and add potential arguments.
    #
    # The result is inserted as a snippet, so it's
    # possible to tab through the place holders.
    
    # single tags
    single_no_arg = /^(?:br|hr)$/i
    single        = /^(?:img|meta|link|input|base|area|col|frame|param)$/i
    
    # handle the case where caret is in the middle of a word, assume only the left part is the tag
    index = ENV['TM_LINE_INDEX'].to_i - ENV['TM_INPUT_START_LINE_INDEX'].to_i
    tag, suffix = STDIN.read, ''
    if index < tag.length && !ENV['TM_SELECTED_TEXT']
      tag, suffix = tag[0...index], tag[index..-1]
    end
        
    default_tag = ENV['TM_DEFAULT_TAG'] || 'p'
    
    result = case tag
      when single_no_arg then "<#{tag}/>"
      when single then        "<#{tag} $1/>"
      when '' then            "<${1:#{default_tag}}>$2</${1:#{default_tag}}>"
      else                    "<#{tag}>$1</#{tag.strip[/^\S+/]}>"
    end
    
    "#{result}#{suffix}"
  end
end
