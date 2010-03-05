require 'ruble'

HTML_TEMPLATES = { 
  'strict.html' => 'HTML - 4.01 Strict',
  'transitional.html' => 'HTML - 4.01 Transitional',
  'strict_1_0.xhtml' => 'XHTML - 1.0 Strict',
  'transitional_1_0.xhtml' => 'XHTML - 1.0 Transitional',
  'frameset_1_0.xhtml' => 'XHTML - 1.0 Frameset',
  '1_1.xhtml' => 'XHTML - 1.1'
}
HTML_TEMPLATES.each do |filename, name|
  filetypes = ["*.html"]
  filetypes <<  "*.xhtml" if filename.end_with? ".xhtml"
  filetypes.each do |filetype|
    template(name + " Template (#{filetype})") do |t|
      t.filetype = filetype
      t.invoke do |context|
        ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
        raw_contents = IO.read("#{ENV['TM_BUNDLE_SUPPORT']}/../templates/#{filename}")
        raw_contents.gsub(/\$\{([^}]*)\}/) {|match| ENV[match[2..-2]] }
     end
    end  
  end
end