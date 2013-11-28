require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_list'

module CrowdFund
  class FundRequest
    attr_reader :name

    def initialize(name)
      @name = name.upcase
      @projects = []
    end

    #super refactoring
    def funds_entry(project)
      formatted_name = project.name.ljust(20, '.')
      "#{formatted_name} got $#{project.fund} and had a goal of $#{project.goal}"
    end

    def save_projects_that_need_funding(to_file="need_funds.txt")
      File.open(to_file, "w") do |file|
        under_funded = @projects.select {|project| !project.target?}
        file.puts "#{under_funded.count} Projects From #{name} Event That Need Funds:"
        under_funded.each do |project|
          file.puts funds_entry(project)
        end
      end
    end

    def save_fully_funded_projects(to_file="fully_funded")
      File.open(to_file, "w") do |file|
        fully_funded = @projects.select {|project| project.target?}
        file.puts "#{fully_funded.count} Projects From #{name} Event Were Fully Funded:"
        fully_funded.each do |project|
          file.puts funds_entry(project)
        end
      end
    end

    def load_projects(from_file)
      File.readlines(from_file).each do |line|
        add_project(Project.from_csv(line))
      end
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
        puts funds_entry(fully_funded)
      end

      puts "\n #{under_funded.count} Under Funded Projects:"
      under_funded.each do |under_funded|
        puts funds_entry(under_funded)
      end

      puts "\nThese projects are far from their goal:"

      sorted_amount = under_funded.sort
      sorted_amount.each do |project|
        puts funds_entry(project)
      end

      @projects.each do |project|
        puts "\n#{project.name}'s pledges:"
        project.each_pledge_recieved do |pledge|
          puts "$#{pledge.amount} in #{pledge.name} pledges"
        end
      end
    end
  end
end
