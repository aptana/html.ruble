require 'ruble'

command t(:insert_close_tag) do |cmd|
  cmd.output = :insert_as_text
  cmd.input = :none
  cmd.invoke do |context|
    doc        = context.editor.document.get
    line       = ENV['TM_LINE_NUMBER'].to_i
    line_index = ENV['TM_LINE_INDEX'].to_i
    
    if ENV.has_key? 'TM_INPUT_START_LINE'
      line       = ENV['TM_INPUT_START_LINE'].to_i
      line_index = ENV['TM_INPUT_START_LINE_INDEX'].to_i
    end
    
    before = /(.*\n){#{line-1}}.{#{line_index}}/.match(doc)[0]
    
    before.gsub!(/<[^>]+\/\s*>/i, '')
    
    # remove all self-closing tags 
    if ENV.has_key?('TM_HTML_EMPTY_TAGS')
      empty_tags = ENV['TM_HTML_EMPTY_TAGS']
      before.gsub!(/<(#{empty_tags})\b[^>]*>/i, '')
    end
    
    # remove all comments
    before.gsub!(/<!--.*?-->/m, '')
    
    stack = [ ]
    before.scan(/<\s*(\/)?\s*(\w[\w:-]*)[^>]*>/) do |m|
      if m[0].nil?
        stack << m[1]
      else
        until stack.empty? do
          close_tag = stack.pop
          break if close_tag == m[1]
        end
      end
    end
    
    if stack.empty?
      # TODO Make it beep!
      nil
    else
      "</#{stack.pop}>"
    end
  end
end
