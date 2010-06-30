require 'ruble'
require 'tminclude'

command 'Update Document' do |cmd|
  cmd.key_binding = 'CONTROL+COMMAND+U'
  cmd.scope = 'text.html'
  cmd.output = :replace_document
  cmd.input = :document
  cmd.invoke { Dir.chdir(File.dirname(ENV['TM_FILEPATH'])); Ruble::Includes.instance.process_persistent_includes($stdin) }
end
