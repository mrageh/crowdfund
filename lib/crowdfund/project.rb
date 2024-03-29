require_relative 'pledge_list'
require_relative 'fundable'

module CrowdFund
  class Project
    include Fundable
    attr_accessor :goal, :fund
    attr_reader :name
    def initialize(name, fund=0, goal=3000)
      @name = name.upcase
      @fund = fund
      @goal = goal
      @pledges = Hash.new(0)
    end

    def self.from_csv(string)
      name,fund,goal = string.split(",")
      Project.new(name, Integer(fund), Integer(goal))
    end

    def pledge_total(pledge)
      @pledges[pledge.name] += pledge.amount
      puts "Project #{name} received a #{pledge.name} pledge worth $#{pledge.amount}"
      puts "Project #{name} pledges: #{@pledges}"
    end

    def each_pledge_recieved
      @pledges.each do |name, amount|
        yield Pledge.new(name, amount)
      end
    end

    def points
      @pledges.values.reduce(0, :+)
    end

    def to_s
      "Project #{@name.upcase} has $#{@fund} in funding towards a goal of $#{@goal}"
    end

    def expensive?
      if fund >= 1000
        true
      else
        false
      end
    end

    def target?
      fund >= goal
    end

    def <=> (other_project)
      other_project.outstanding_funds <=> outstanding_funds
    end
  end
end
  # if __FILE__ == $PROGRAM_NAME
  #   puts $PROGRAM_NAME
  #   puts __FILE__
  #   project = Project.new('abc', 100, 2000)
  #   puts project.name
  #   puts project.fund
  #   puts project.goal
  #   puts project
  #   project.lost_funds
  #   project.got_funds
  # end
