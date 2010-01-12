require 'radrails'

command 'Strip HTML Tags from Document / Selection' do |cmd|
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke {|context| context.in.read.gsub(/<\/?[^>]*>/, "") }
end
