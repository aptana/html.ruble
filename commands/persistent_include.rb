require 'ruble'
require 'tminclude'

command 'Add Persistent Include' do |cmd|
  cmd.key_binding = 'CONTROL+COMMAND+i'
  cmd.scope = 'text.html'
  cmd.output = :insert_as_text
  cmd.input = :none
  cmd.invoke { Ruble::Includes.instance.include_command }
end
