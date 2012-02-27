require 'ruble'

command t(:select_tag_content) do |cmd|
  cmd.key_binding = 'CONTROL+M2+/'
  cmd.scope = 'text.html - source'
  cmd.output = :discard
  cmd.input = :none
  cmd.invoke do |context|
    offset = context.editor.caret_offset
    root_node = context.editor.editor_part.getAST
    node = root_node.getNodeAtOffset(offset)

    # if node is a text node, grab the previous node, which should be the elementNode
    if node.getNodeType == com.aptana.editor.html.parsing.ast.IHTMLNodeTypes::TEXT
      node = node.getPreviousNode
    end
    
    # This selects the content and the end tag. Assumes the node is an HTMLEelementNode
    begin
      context.editor.selection = (node.name_node.name_range.ending_offset + 1...node.end_node.name_range.starting_offset)
    rescue Exception => e
      log_error e.inspect
    end
  end
end
