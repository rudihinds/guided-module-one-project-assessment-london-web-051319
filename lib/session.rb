class Session < ActiveRecord::Base

    belongs_to :coach
    belongs_to :fighter

    def self.all_session
      self.all
    end

    def self.one_session
      self.first
    end

    def whos_my_coach
      self.coach.name
    end
  #
  # def initialize(coach, fighter, time)
  #   @coach = coach
  #   @fighter = fighter
  #   @time = time
  # end
  #
  # def self.check_sessions
  #
  # def create_new_session(fighter_name, coach_name, time)
  #   coach = Coach.find_by(name: coach_name)
  #   coach_id = coach.id
  #   fighter = Fighter.find_by(name: fighter_name)
  #   fighter_id = fighter.id
  #   Session.new()
  # end

end
