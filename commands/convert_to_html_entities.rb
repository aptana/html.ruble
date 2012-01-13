require 'ruble'

command t(:convert_to_entities) do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :character
  cmd.invoke do |context|
    $KCODE = 'U'
    require 'encode'
    encode(STDIN.read)
  end
end
