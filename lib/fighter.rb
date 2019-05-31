class Fighter < ActiveRecord::Base

  has_many :sessions
  has_many :coaches, through: :sessions

  def self.new_fighter(name)
    fighter = self.create(name: name)
    fighter
  end

  def self.create_new_session(coach_name, fighter)
    coach = Coach.find_by(name: coach_name)
    Session.create(coach_id: coach.id, fighter_id: fighter.id)
  end
  # rudi
  # "Ricardo Liborio"

  def my_sessions_with(name)
    coach = Coach.find_by(name: name)
    coach_id = coach.id
    # how can I include a name as argument and
    sessions = self.sessions.where(coach_id: coach_id)
    sessions
  end

  # def update_session_time()



#   belongs_to :coach
#
# def initialize(name: name)
#   @name = name
# end
#
#
#
#
# def trainer
#     # Trainer.all.find{ |trainer| trainer.id == self.trainer_id }
#     # OR use AR .find
#     Trainer.find(self.trainer_id)
#   end
end
