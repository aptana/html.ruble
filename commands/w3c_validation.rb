require 'ruble'
require 'httpclient'

command 'Validate Syntax (W3C)' do |cmd|
  cmd.key_binding = 'CONTROL+M2+V'
  cmd.scope = 'text.html'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke do |context|
    $KCODE = 'U'
    page = STDIN.read
    page.gsub!(/<\?(php|=).*?\?>|<%.*?%>/m, '')

    # try direct input path
    result = HTTPClient.post 'http://validator.w3.org/check', { :fragment => page }
    
    content = result.content
    content = content.gsub(/<\/title>/, '\&<base href="http://validator.w3.org/">')
    content.gsub!(/Line (\d+),? Column (\d+)/i) do
      # FIXME These links won't work for us!
      "<a href='txmt://open?line=#$1&column=#{$2.to_i + 1}'>#$&</a>"
    end
    content
  end
end
