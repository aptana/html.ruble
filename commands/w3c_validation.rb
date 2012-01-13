require 'ruble'

command t(:validate_syntax) do |cmd|
  cmd.key_binding = 'CONTROL+M2+V'
  cmd.scope = 'text.html'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke do |context|
    $KCODE = 'U'
    page = $stdin.read
    page.gsub!(/<\?(php|=).*?\?>|<%.*?%>/m, '')
    
    w3c_url = 'http://validator.w3.org/check'
    
    require 'net/http'
    require 'uri'
    
    response = Net::HTTP.post_form(URI.parse(w3c_url), {'ss' => "1", 'fragment' => page})
    status = response['x-w3c-validator-status']
    
    content = response.body
    content = content.gsub(/<\/title>/, '\&<base href="http://validator.w3.org/">')
    # content.gsub!(/Line (\d+),? Column (\d+)/i) do
    #   # FIXME These links won't work for us!
    #   "<a href='txmt://open?line=#\$1&column=#{\$2.to_i + 1}'>#\$&</a>"
    # end
    content
  end
end
