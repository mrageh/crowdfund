def time
  Time.new.strftime("as of %d/%m/%y")
end

def fundraising_project(name, fund=0)
  "Project #{name.upcase} has $#{fund} in funds as of #{time}"
end
puts fundraising_project("cour", 1000)
puts fundraising_project("build", 1500)
puts fundraising_project("salf")

