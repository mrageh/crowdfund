class Crowdfund
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
puts first_project
second_project = Crowdfund.new('lmn', 500)
puts second_project
second_project.lost_funds
first_project.got_funds

puts second_project
puts first_project
