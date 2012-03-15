require 'ruble'

project_template t(:basic_web_template_name) do |t|
  t.type = :web
  t.location = "templates/basic_web_template.zip"
  t.description = t(:basic_web_template_desc)
  t.replace_parameters = false
end

project_template t(:html5_template_name) do |t|
  t.type = :web
  t.location = "git://github.com/h5bp/html5-boilerplate.git"
  t.description = t(:html5_template_desc)
  t.replace_parameters = false
end

project_template t(:cached_html5_template_name) do |t|
  t.type = :web
  t.location = "templates/html5_template.zip"
  t.description = t(:cached_html5_template_desc)
  t.replace_parameters = false
end
