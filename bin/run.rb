require_relative '../config/environment'

  cli = CommandLineInterface.new
  cli.greet
  # cli.get_name
  name = gets.chomp
  puts "GREAT! Ok master #{name},"
  new_fighter = cli.get_user(name)
  cli.run
