require 'ruble'

# Lookup current word as a tag name on w3c.org
command t(:docs_for_tag) do |cmd|
  cmd.key_binding = 'CONTROL+M2+H'
  cmd.scope = 'text.html, text.html entity.name.tag'
  cmd.output = :show_as_html
  cmd.input = :none
  cmd.invoke do |context|
    require 'html_tags'

    line, col = ENV["TM_CURRENT_LINE"].to_s, ENV["TM_LINE_INDEX"].to_i
    tag = line =~ /\A.{0,#{col}}<\s*(\w+)/ ? $1 : ENV["TM_CURRENT_WORD"].to_s
    
    path = HTML_TAGS[tag.upcase] || request_tag_name(tag)
    if path.nil?
      nil
    else
      url  = "http://www.w3.org/TR/html4/index/" + path
      "<meta http-equiv='Refresh' content='0;URL=#{url}'>"
    end
  end
end
