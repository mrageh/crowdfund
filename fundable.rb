module Fundable
  def lost_funds
    puts"Project #{name} lost some funds!"
    self.fund -= 15
  end

  def outstanding_funds
    self.goal - self.fund
  end

  def got_funds
    puts "Project #{name} got more funds!"
    self.fund += 25
  end
end
