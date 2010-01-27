require 'ruble'
require 'tminclude'

command 'Update Document' do |cmd|
  cmd.key_binding = 'CONTROL+COMMAND+u'
  cmd.scope = 'text.html'
  cmd.output = :replace_document
  cmd.input = :document
  cmd.invoke {|context| Ruble::Includes.instance.process_persistent_includes(context.in) }
end
