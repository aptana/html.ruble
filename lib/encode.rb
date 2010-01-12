
def char_to_entity
  if @char_to_entity.nil?
    @char_to_entity = {}
    File.open("#{ENV['TM_BUNDLE_SUPPORT']}/entities.txt").read.scan(/^(\d+)\t(.+)$/) do |key, value|
      @char_to_entity[[key.to_i].pack('U')] = value
    end
  end
  @char_to_entity
end
    
def encode(text)
  text.gsub(/[^\x00-\x7F]|["'<>&]/) do |ch|
    ent = char_to_entity[ch]
    ent ? "&#{ent};" : sprintf("&#x%02X;", ch.unpack("U")[0])
  end
end