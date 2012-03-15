require 'ruble'

command t(:update_document) do |cmd|
  cmd.key_binding = 'CONTROL+COMMAND+U'
  cmd.scope = 'text.html'
  cmd.output = :replace_document
  cmd.input = :document
  cmd.invoke do
    Dir.chdir(File.dirname(ENV['TM_FILEPATH']))
    require 'tminclude'
    Ruble::Includes.instance.process_persistent_includes($stdin)
  end
end
