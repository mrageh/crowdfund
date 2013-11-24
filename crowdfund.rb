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

first_project = Crowdfund.new('xyz', 25, 75)
second_project = Crowdfund.new('lmn', 500)
projects = [first_project, second_project]

projects.each do |project|
  puts project
end

projects.each do |pro|
  puts "#{pro.name} raised: $#{pro.fund}"
end
