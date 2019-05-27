class CommandLineInterface

  def greet
    puts "Hello and welcome to FindMyCoach! So you're looking for a coach to improve your BAMBAM! fighting skills?"
    puts "Enter your name, Warrior, and let's do this!"
  end

  def get_user(name)
    fighter = Fighter.new_fighter(name)
    fighter
  end

  def run
    puts "now let's find your specialist coach who can tailor things around exactly what
    you need. So, what style of martial art are you most interested in learning?
    Here's a list of all the styles available to help you out!"
      Coach.all_styles
    puts "choose one, warrior!"
      my_style = gets.chomp
    puts "Great! Here's a list of our world-class coaches for #{my_style}!"
      coaches = Coach.find_coaches_by_style(my_style)
  end
  #






end
