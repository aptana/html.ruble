require 'ruble'

HTML_TEMPLATES = {
  'strict.html' => t(:html_4_strict),
  'transitional.html' => t(:html_4_transitional),
  'strict_1_0.xhtml' => t(:xhtml_1_strict),
  'transitional_1_0.xhtml' => t(:xhtml_1_transitional),
  'frameset_1_0.xhtml' => t(:xhtml_1_frameset),
  '1_1.xhtml' => t(:xhtml_11)
} unless defined?(HTML_TEMPLATES)

HTML_TEMPLATES.each do |filename, name|
  filetypes = ["*.html"]
  filetypes <<  "*.xhtml" if filename.end_with? ".xhtml"
  filetypes.each do |filetype|
    template t(:html_file_template_name, :name => name, :filetype => filetype) do |t|
      t.filetype = filetype
      t.location = "templates/#{filename}"
    end
  end
end

template t(:html5_file_template_name) do |t|
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