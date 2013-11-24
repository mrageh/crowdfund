class Crowdfund
  attr_reader :goal, :name, :fund
  def initialize(name, fund=0, goal=3000)
    @name = name
    @fund = fund
    @goal = goal
  end

  def to_s
    "Project #{@name.upcase} has $#{@fund} in funding towards a goal of $#{@goal}"
  end

  def lost_funds
    puts"Project #{@name.upcase} lost some funds!"
    @fund -= 15
  end

  def got_funds
    puts "Project #{@name.upcase} got more funds!"
    @fund += 25
  end
end

class Project
  attr_reader :name
  def initialize(name)
    @name = name.capitalize
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def show_projects
    puts "There are #{@projects.size} fundraising projects in #{name}:"
    @projects.each do |project|
      puts project
      project.lost_funds
      project.got_funds
      project.got_funds
      puts project
    end
  end
end
first_project = Crowdfund.new('xyz', 25, 75)
second_project = Crowdfund.new('lmn', 500)
third_project = Crowdfund.new('abc', 1000, 20000)

ruby_conf = Project.new('ruby_conf')
ruby_conf.add_project(first_project)
ruby_conf.add_project(second_project)
ruby_conf.add_project(third_project)
ruby_conf.show_projects
