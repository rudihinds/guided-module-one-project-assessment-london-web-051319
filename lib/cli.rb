class CommandLineInterface

  def greet
    puts "Hello and welcome to FindMyCoach! So you're looking for a coach to improve your BAMBAM! fighting skills?"
    puts "Enter your name, Warrior, and let's do this!"
  end

  def get_user(name)
    fighter = Fighter.new_fighter(name)
    fighter
  end

  # def run
  #   #
  #   # So, what style of martial art are you most interested in learning?
  #   # Here's a list of all the styles available to help you out!"
  #   #   Coach.all_styles
  #   # puts "choose one, warrior!"
  # end

  def list_coaches_by_style(style)
    puts "Great! Here's a list of our world-class coaches for #{style}!"
      puts "\n"
      coaches = Coach.where("style == '#{style}'")
      i = 1
      coaches.each do |coach|
        puts "#{i}. #{coach.name}"
        i+=1
      end
      puts "\n"
  end

  def create_session(fighter)
    puts "Let's go ahead and get a new session booked in for you."
    puts "\n"
    puts "Choose your style of combat..."
    puts "\n"
    Coach.all_styles
    puts "\n"
    style = gets.chomp
    puts "\n"
    list_coaches_by_style(style)
    # puts "Available coaches for #{style}.
    puts "Pick the number of the coach you would
like to train with"
    puts "\n"
    coaches = Coach.where("style == '#{style}'")
    num = gets.chomp
    i = num.to_i-1
    my_coach = coaches[i].name
    puts "\n"
    puts "#{my_coach}? That's a fantastic choice!"
    new_session = Fighter.create_new_session(my_coach, fighter)
    puts "\n"
    puts"********** Booking confirmation ***********"
    puts "\n"
    puts "\n"
    puts "#{new_session.coach.style.upcase} WITH #{new_session.coach.name.upcase}"
    puts "\n"
    puts "\n"
    puts"*******************************************"
    puts "Great, that's all booked in for you!"
    puts "\n"
    puts "\n"
  end

  def options(fighter)
    puts "\n"
    puts "Please type the number of the task that you want to do next. Press any other key to exit the program:"
    puts "\n"
    puts "1. View my sessions - Shows all of your sessions"
    puts "2. Change a coach - Change the coach on one of your sessions"
    puts "3. Delete session - Deletes one of your sessions"
    puts "4. Create a new session - Pick a new coach and book a fresh session"
    puts "\n"
    choice = gets.chomp
    puts "\n"
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
    # sessions = Session.where(fighter_id: fighter.id)
    puts"********** Your Session Bookings ***********"
    puts "\n"
    puts "\n"
    n = 1
    fighter.sessions.all.each do |session|
      puts "#{n}. #{session.coach.style} with #{session.coach.name}"
      n += 1
  end
    #
    # sessions.each do |session|
    #   puts "#{session.coach.style} with #{session.coach.name}"
    # i = 1
    # fighter.sessions.each do |session|
    #   puts "#{i}. #{session.coach.style} with #{session.coach.name}"
    #   i += 1
    puts "\n"
    puts "\n"
    puts"********************************************"
  end
    # i = 1
    # fighter.sessions.each do |session|
    #   puts "#{i}. #{session.coach.style} with #{session.coach.name}"
    #   i += 1
    # end
    # puts "\n"

  def change_coach(fighter)
    # view_all(fighter)
    puts "Type the number of the session on which you would like to change your coach"
    puts "\n"
    view_all(fighter)
    puts "\n"
    x = gets.chomp
    puts "\n"
    y = x.to_i-1
    session = fighter.sessions.all[y]
    puts "Ok, so you want to change #{x}. #{session.coach.style} with #{session.coach.name}"
    puts "\n"
    puts "Who would you like to train with? Type a number"
      i = 1
    Coach.all.each do |coach|
      puts "#{i}. #{coach.name} for #{coach.style}"
      i += 1
    end
    puts "\n"
    j = gets.chomp
    puts "\n"
    k = j.to_i-1
    new_coach = Coach.all[k]
    session.update(coach_id: new_coach.id)
    puts "Great choice, Warrior, #{new_coach.name} will get you fight ready in no time!"
    puts "\n"
    end
    # n = 1
    # fighter.sessions.all.each do |session|
    #   puts "#{n}. #{session.coach.style} with #{session.coach.name}"
    #   n += 1
    # end
    # a=1
    # view_all(fighter)


    def delete_session(fighter)
      puts "Please choose which session you would like to delete"
      puts "\n"
      view_all(fighter)
      puts "\n"
      x = gets.chomp
      x = x.to_i
      session = fighter.sessions[x-1]
      session.delete
      puts "Poof! All gone!"
      puts "\n"
    end
    
    def check_slots(fighter)
      puts "Choose a slot"
      puts "1. 08.00-10.00\n2. 10.00-12.00\n3. 12.00-14.00\n4. 14.00-16.00\n5. 16.00-18.00\n6. 18.00-20.00"
      choice = gets.chomp
      choice = choice.to_i
      session_slot = Coach.find(10).sessions.select do |session|
        session.time_slot == choice
      end
      if session_slot.empty?
        Session.create(Coach.find(10).id, )
      else
        check_slots
      end

    end
    # show sessions, offer way to pick one, by id maybe.
    # use id to search for session. store as session
    # show all coaches and styles to choose one
    # take coach id and style and change session.style and .coach_id to reflect
    # show ammended to xxxxx with xxxxx
  end
