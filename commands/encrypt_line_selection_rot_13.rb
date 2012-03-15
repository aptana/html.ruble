require 'ruble'

def e_js(str)
  str.gsub(/(?=[\\"])/, '\\').gsub(/\n/, '\n').gsub(/[@.\/]/) { |ch| sprintf('\\%03o', ch[0]) }
end

def rot_13(str)
  str.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

command t(:rot_13) do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :line
  cmd.invoke do |context|
%{<script type="text/javascript">document.write(
"#{e_js(rot_13(STDIN.read))}".replace(/[a-zA-Z]/g, function(c){return String.fromCharCode((c<="Z"?90:122)>=(c=c.charCodeAt(0)+13)?c:c-26);}));
</script>}
  end
end
