require 'ruble'

command 'Add Persistent Include' do |cmd|
  cmd.key_binding = 'CONTROL+COMMAND+I'
  cmd.scope = 'text.html'
  cmd.output = :insert_as_text
  cmd.input = :none
  cmd.invoke { require 'tminclude'; Ruble::Includes.instance.include_command }
end
