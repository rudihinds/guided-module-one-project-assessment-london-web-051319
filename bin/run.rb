require_relative '../config/environment'

  cli = CommandLineInterface.new
  cli.greet
  cli.check_slots
  # cli.get_name
  # name = gets.chomp
  # puts "\n"
  # puts "GREAT! Ok master #{name},"
  # puts "\n"
  # new_fighter = cli.get_user(name)
  # puts "We are going to find you a specialist combat coach who can tailor things around exactly what you need."
  # cli.create_session(new_fighter)
  # cli.options(new_fighter)


  # choice = gets.chomp
  # cli.view_all(new_fighter)
  # cli.change_coach(new_fighter)
  # my_style = gets.chomp
  # cli.list_coaches_by_style(my_style)
