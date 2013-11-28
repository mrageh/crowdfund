require_relative 'die'
require_relative 'project'
require_relative 'pledge_list'

module CrowdFund
  module FundingRound

    def self.round(project)
      number_rolled = Die.new.roll
      if number_rolled % 2 == 0
        project.got_funds
      elsif number_rolled % 2 > 0
        project.lost_funds
      end
      pledge = PledgeList.random
      project.pledge_total(pledge)
    end

  end
end
