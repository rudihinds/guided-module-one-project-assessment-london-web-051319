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
    puts "We are going to find you a specialist combat coach who can tailor things around exactly what
    you need."
    #
    # So, what style of martial art are you most interested in learning?
    # Here's a list of all the styles available to help you out!"
    #   Coach.all_styles
    # puts "choose one, warrior!"
  end

  def list_coaches_by_style(style)
    puts "Great! Here's a list of our world-class coaches for #{style}!"
      coaches = Coach.where("style == '#{style}'")
      i = 1
      coaches.map do |coach|
        puts "#{i}. #{coach.name}"
        i+=1
      end
  end

  def create_session(fighter)
    puts "Let's go ahead and get a new session booked in for you.
Choose your style of combat..."
    Coach.all_styles
    style = gets.chomp
    list_coaches_by_style(style)

    # puts "Available coaches for #{style}.
    puts "Pick the number of the coach you would
like to train with"
    coaches = Coach.where("style == '#{style}'")
    num = gets.chomp
    i = num.to_i-1
    my_coach = coaches[i].name
    puts "#{my_coach}? That's a fantastic choice! What time would you like to book your
session in for?"
    my_time = gets.chomp
    Fighter.create_new_session(my_coach, my_time, fighter)
    puts "Fantastic, that's all booked in for you!"
  end

  def options(fighter)
    puts "Please type the number of the task that you want to do next:"
    puts "1. View my sessions - Shows all of your sessions"
    puts "2. Change a coach - Change the coach on one of your sessions"
    puts "3. Delete session - Deletes one of your sessions"
    puts "4. Create a new session - Pick a new coach and book a fresh session"

    choice = gets.chomp
      case choice
      when "1"
        view_all(fighter)
        options(fighter)
      when "2"
        change_coach(fighter)
        options(fighter)
      when "3"
        delete_session(fighter)
        options(fighter)
      when "4"
        create_session(fighter)
        options(fighter)
      else
        puts "See you soon!"
      end

  end

  def view_all(fighter)
    i = 1
    fighter.sessions.each do |session|
      puts "#{i}. #{session.coach.style} with #{session.coach.name}"
      i += 1
    end

  end

  def change_coach(fighter)
    # view_all(fighter)
    puts "Type the number of the session on which you would like to change your coach"
    x = gets.chomp
    y = x.to_i-1
    session = fighter.sessions[y]
    puts "Ok, so you want to change #{x}. #{session.coach.style} with #{session.coach.name}"
    puts "Who would you like to train with? Type a number"
      i = 1
    Coach.all.each do |coach|
      puts "#{i}. #{coach.name} for #{coach.style}"
      i += 1
    end
    j = gets.chomp
    k = j.to_i-1
    new_coach = Coach.all[k]
    session.coach_id = new_coach.id
    puts "Great choice, Warrior, #{new_coach.name} will get you fight ready in no time!"
  end

    def delete_session(fighter)
      puts "Please choose which session you would like to delete"
      view_all(fighter)
      x = gets.chomp
      x = x.to_i
      session = fighter.sessions[x-1]
      session.delete
      puts "Poof! All gone!"
    end

    # show sessions, offer way to pick one, by id maybe.
    # use id to search for session. store as session
    # show all coaches and styles to choose one
    # take coach id and style and change session.style and .coach_id to reflect
    # show ammended to xxxxx with xxxxx
  end
