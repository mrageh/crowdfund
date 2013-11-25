require_relative 'project'
class FundRequest
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
