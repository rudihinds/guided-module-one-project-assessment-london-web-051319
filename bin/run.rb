require_relative '../config/environment'

  cli = CommandLineInterface.new
  cli.greet
  # cli.get_name
  name = gets.chomp
  puts "GREAT! Ok master #{name},"
  new_fighter = cli.get_user(name)
  cli.run
  cli.create_session(new_fighter)
  cli.options(new_fighter)


  # choice = gets.chomp
  # cli.view_all(new_fighter)
  # cli.change_coach(new_fighter)
  # my_style = gets.chomp
  # cli.list_coaches_by_style(my_style)
