require 'ruble'

command t(:decode_entities) do |cmd|
  cmd.key_binding = 'M1+M2+7'
  cmd.scope = 'text.html'
  cmd.output = :replace_selection
  cmd.input = :selection, :line
  cmd.invoke do |context|
    # TODO Extract this out to a decode lib file?
    $KCODE = 'U'
    # FIMXE Seems that the KCode isn't actually getting set here, so the character inserted isn't what we'd expect for unicode chars, it's broken
    entity_to_char = { }
    File.open("#{ENV['TM_BUNDLE_SUPPORT']}/entities.txt").read.scan(/^(\d+)\t(.+)$/) do |key, value|
      entity_to_char[value] = [key.to_i].pack('U')
    end
    
    STDIN.read.gsub(/&(?:([a-z0-9]+)|#([0-9]+)|#x([0-9A-F]+));/i) do |m|
      if $1 then
        entity_to_char[$1] || m
      else
        [$2 ? $2.to_i : $3.hex].pack("U")
      end
    end
  end
end
