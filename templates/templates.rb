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
      t.location = "templates/#{filename}"
    end
  end
end

template("HTML 5 Template") do |t|
  t.filetype = "*.html"
  t.location = "templates/html5.html"
end

#template("IDL Template") do |t|
#  t.filetype = "*.idl"
#  t.location = "templates/template.idl"
#end

#template("DTD Template") do |t|
#  t.filetype = "*.dtd"
#  t.location = "templates/template.dtd"
#end

#template("SVG Template") do |t|
#  t.filetype = "*.svg"
#  t.location = "templates/template.svg"
#end