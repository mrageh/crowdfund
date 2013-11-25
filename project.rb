class Project
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

  def outstanding_funds
    @goal - @fund
  end

  def got_funds
    puts "Project #{@name.upcase} got more funds!"
    @fund += 25
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
end

if __FILE__ == $PROGRAM_NAME
  puts $PROGRAM_NAME
  puts __FILE__
  project = Project.new('abc', 100, 2000)
  puts project.name
  puts project.fund
  puts project.goal
  puts project
  project.lost_funds
  project.got_funds
end