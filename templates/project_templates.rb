require 'ruble'

project_template "Basic Web Template" do |t|
  t.type = :web
  t.location = "templates/basic_web_template.zip"
  t.description = "A basic template which includes only a default index.html file"
  t.replace_parameters = false
end

project_template "HTML5 Boilerplate" do |t|
  t.type = :web
  t.location = "git://github.com/paulirish/html5-boilerplate.git"
  t.description = "Paul Irish's HTML5 Boilerplate (http://html5boilerplate.com/). Requires network access."
  t.replace_parameters = false
end

project_template "HTML5 Boilerplate (Cached)" do |t|
  t.type = :web
  t.location = "templates/html5_template.zip"
  t.description = "Cached version of Paul Irish's HTML5 Boilerplate project for those without network access, current as of 2011-08-01."
  t.replace_parameters = false
end
