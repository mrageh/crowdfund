class Crowdfund
  def initialize(name, fund=0)
    @name = name
    @fund = fund
  end

  def time
    Time.new.strftime("as of %d/%m/%y")
  end

  def to_s
    "Project #{name.upcase} has $#{fund} in funds as of #{time}"
  end

  def donation
    @fund += 100
  end
end

first_project = Crowdfund.new('poor', 100)
puts first_project
first_project.donation
puts first_project
