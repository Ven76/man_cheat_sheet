@options = ['cd', 'mkdir', 'touch', 'vim', 'cat', 'ls' ] 

def main_menu
  puts '*** Command Line Menu ***'
  puts '1. Command Line'
  puts '2. Search'
  puts '3. Exit'

  case gets.chomp.to_i
    when 1
      command_choices
    when 2
      search
    when 3
      puts 'thanks for using command line'
      exit(0)
    else
      error_message
      main_menu
  end
end

def command_choices
  # index = 1
  puts '** Man Commands **'
  @options.each_with_index do |option, index|
    puts "#{index + 1}. #{option}"
    # index += 1
  end

  choice = gets.chomp.to_i
  man_output(@options[choice - 1])
end

def search
  puts 'Enter a command for a man page:'
  man_output(gets.chomp)
end

def man_output(man_command)
  puts `man #{man_command}`
  main_menu
end

def error_message(message = nil)
  if message
    puts message
  else
    puts 'Invalid Choice, Please Try Again!'
  end
end

main_menu

# Fully working, not dry, no methods, but works
# user_choice = gets.chomp.to_i

# case user_choice
#   when 1
#     puts '** Man Commands **'
#     puts '1. cd'
#     puts '2. mkdir'
#     puts '3. touch'
#     command_choice = gets.chomp.to_i
#     case command_choice
#       when 1
#         puts `man cd`
#       when 2
#         puts `man mkdir`
#       when 3
#         puts `man touch`
#       else
#         puts 'invalid choice'
#     end
#   when 2
#     puts 'Enter a command for a man page:'
#     search_term = gets.chomp
#     puts `man #{search_term}`
#   when 3
#     puts 'Thanks for using the command line menu'
#     exit(0)
#   else
#     puts 'invalid choice'
# end
