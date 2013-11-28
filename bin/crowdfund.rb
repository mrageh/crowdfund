require_relative "fundrequest"

first_project  = CrowdFund::Project.new('xyz', 25, 75)
second_project = CrowdFund::Project.new('lmn', 500)
third_project  = CrowdFund::Project.new('abc', 1000, 20000)

ruby_conf = CrowdFund::FundRequest.new('ruby_conf')
ruby_conf.load_projects(ARGV.shift || "projects.csv")

loop do
  puts "How many rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when 'quit', 'exit'
    ruby_conf.print_stats
    break
  when /^\d+$/
     ruby_conf.show_projects(answer.to_i)
  else
    puts "Please enter a number or 'quit'"
  end
end

ruby_conf.save_projects_that_need_funding
ruby_conf.save_fully_funded_projects
