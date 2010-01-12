require 'radrails'
require 'tminclude'

command 'Update Document' do |cmd|
  cmd.key_binding = 'CONTROL+COMMAND+u'
  cmd.scope = 'text.html'
  cmd.output = :replace_document
  cmd.input = :document
  cmd.invoke {|context| RadRails::Includes.instance.process_persistent_includes(context.in) }
end
