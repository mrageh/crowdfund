require_relative 'project'
require_relative 'die'

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
      number_rolled = Die.new.roll
      if number_rolled % 2 == 0
        project.got_funds
      elsif number_rolled % 2 > 0
        project.lost_funds
      end
    end
  end
end
