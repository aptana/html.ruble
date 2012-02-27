require 'ruble'

project_template "Basic Web Template" do |t|
  t.type = :web
  t.id = "com.aptana.project.template.web.basic"
  t.location = "templates/basic_web_template.zip"
  t.description = "A basic template which includes only a default index.html file"
  t.replace_parameters = false
end

project_template "HTML5 Boilerplate" do |t|
  t.type = :web
  t.id = "com.aptana.project.template.web.html5"
  t.location = "git://github.com/h5bp/html5-boilerplate.git"
  t.description = "Paul Irish's HTML5 Boilerplate (http://html5boilerplate.com/). Requires network access."
  t.replace_parameters = false
end

project_template "HTML5 Boilerplate (Cached)" do |t|
  t.type = :web
  t.id = "com.aptana.project.template.web.html5.cached"
  t.location = "templates/html5_template.zip"
  t.description = "Cached version of Paul Irish's HTML5 Boilerplate project for those without network access, current as of 2011-08-01."
  t.replace_parameters = false
end
