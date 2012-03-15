require 'ruble'

command t(:url_escape) do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :line
  cmd.invoke do |context|
    STDIN.read.gsub(/([^a-zA-Z0-9_.-]+)/n) {
      '%' + $1.unpack('H2' * $1.size).join('%').upcase
    }
  end
end
