class Coach < ActiveRecord::Base

  has_many :sessions
  has_many :fighters, through: :sessions
  # has_many :fighters
  #
  # def initialize(name: name, style: style)
  #   @name = name
  #   @style = style
  # end
  def self.find_coaches_by_style(style)
    coaches = Coach.where("style == '#{style}'")
    coaches.each { |coach| puts coach.name }
  end

  def self.all_styles
    coaches = Coach.distinct.pluck(:style)
    puts coaches
  end
  #
  # def fighters
  #   # Boxer.all.select{|boxer| boxer.trainer_id == self.id}
  #   # OR use AR .where
  #   Coach.where(coach_id: self.id)
  # end
end
