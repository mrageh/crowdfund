require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_list'

class FundRequest
  attr_reader :name

  def initialize(name)
    @name = name.upcase
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def show_projects(rounds)
    puts "There are #{@projects.size} fundraising projects in #{name}:"

    pledges = PledgeList::PLEDGES
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth $#{pledge.amount}"
    end
    1.upto(rounds) do |round|
      puts "\nFund raising event round #{round}:"
      @projects.each do |project|
        FundingRound.round(project)
      end
    end
  end

  def print_stats
    fully_funded, under_funded = @projects.partition {|project| project.target?}
    puts "#{name} Statistics For Event:"

    puts "\n #{fully_funded.count} Fully Funded Projects:"
    fully_funded.each do |fully_funded|
      puts "#{fully_funded.name} reached its goal of $#{fully_funded}"
    end

    puts "\n #{under_funded.count} Under Funded Projects:"
    under_funded.each do |under_funded|
      puts "#{under_funded.name} did not reach its goal of $#{under_funded}"
    end

    puts "\nThese projects are far from their goal:"

    sorted_amount = under_funded.sort
    sorted_amount.each do |project|
      puts "#{project.name.ljust(20,'.')} $#{project.outstanding_funds}"
    end

    @projects.each do |project|
      puts "\n#{project.name}'s pledges:"
      project.each_pledge_recieved do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
    end
  end
end
