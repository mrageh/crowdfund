require_relative "fundrequest"

first_project = Project.new('xyz', 25, 75)
second_project = Project.new('lmn', 500)
third_project = Project.new('abc', 1000, 20000)

ruby_conf = FundRequest.new('ruby_conf')
ruby_conf.add_project(first_project)
ruby_conf.add_project(second_project)
ruby_conf.add_project(third_project)
ruby_conf.show_projects
