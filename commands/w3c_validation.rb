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

#fix for w3c blocking http requests without a user-agent
#changed the way the http post is sent to w3c so that it includes a user-agent

uri = URI(w3c_url)
req = Net::HTTP::Post.new(uri.path)
req.set_form_data({'ss' => "1", 'fragment' => page})
req['User-Agent'] = 'Aptana'

response = Net::HTTP.start(uri.host, uri.port) do |http|
  http.request(req)
end
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
