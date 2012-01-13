require 'ruble'

command t(:add_persistent_include) do |cmd|
  # cmd.key_binding = 'CONTROL+COMMAND+I' # Commented out, to avoid conflict with Eclipse debugger
  cmd.scope = 'text.html'
  cmd.output = :insert_as_text
  cmd.input = :none
  cmd.invoke { require 'tminclude'; Ruble::Includes.instance.include_command }
end
