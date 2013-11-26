require_relative 'project'
require_relative 'funding_round'

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
      FundingRound.round(project)
    end
  end
end
