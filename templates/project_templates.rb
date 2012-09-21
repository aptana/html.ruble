require 'ruble'

project_template t(:basic_web_template_name) do |t|
  t.type = :web
  t.tags = ['Web']
  t.id = "com.aptana.project.template.web.basic"
  t.location = "templates/basic_web_template.zip"
  t.description = t(:basic_web_template_desc)
  t.replace_parameters = false
  t.tags = ['Web']
end

project_template t(:html5_template_name) do |t|
  t.type = :web
  t.tags = ['Web']
  t.icon = "templates/HTML5_Logo_64.png"
  t.id = "com.aptana.project.template.web.html5"
  t.location = "git://github.com/h5bp/html5-boilerplate.git"
  t.description = t(:html5_template_desc)
  t.replace_parameters = false
  t.tags = ['Web']
end

project_template t(:cached_html5_template_name) do |t|
  t.type = :web
  t.tags = ['Web']
  t.icon = "templates/HTML5_Logo_64.png"
  t.id = "com.aptana.project.template.web.html5.cached"
  t.location = "templates/html5_template.zip"
  t.description = t(:cached_html5_template_desc)
  t.replace_parameters = false
  t.tags = ['Web']
end
