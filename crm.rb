require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
  attr_accessor :name

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display one contact"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"

  end
  def main_menu
    puts "Welcome to #{@name} database."
    while true
      print_main_menu
      input = gets.chomp.to_i
      choose_option(input)
      return if input == 7
    end
  end

  def choose_option(option)
      case option
      when 1
        then add_contact
      when 2
        then modify_contact
      when 3
        then display_contacts
      when 4
        then display_contact
      when 5
       then display_attribute
      when 6
        then delete_contact
      when 7
        puts "Goobye!"
        return
      else
        puts "Incorrect option, try again."
    end 
  end

  def add_contact
    puts "Provide Contact Details"
    print "First Name:"
    first_name = gets.chomp

    print "Last Name:"
    last_name = gets.chomp

    print "Email:"
    email = gets.chomp

    print "Note:"
    note = gets.chomp

    new_contact = Contact.new(first_name, last_name, email, note)
    display_new_contact = @rolodex.add_contact(new_contact)
    puts "You have added contact number #{display_new_contact-1}" 
  end

  def search_contacts
    print "Look up contact by ID number:"
    id = gets.chomp.to_sym

    if !@rolodex.contacts[id]
        puts "Invalid ID"
      else
        id
    end
  end


  def modify_contact
    contact_to_modify = search_contacts
    puts "#{@rolodex.contacts[contact_to_modify]} Would you like to modify this contact?[Yes/No]"
    input = gets.chomp.downcase
    
    case input
    when "yes"
        puts "What would you like to modify?"
        puts "[1] Modify their first name."
        puts "[2] Modify their last name."
        puts "[3] Modify their email."
        puts "[4] Modify their note."
        answer = gets.chomp.to_i
    end

    case answer
    when 1 
      then print "Their new first name:"
      changed_variable = gets.chomp
    when 2
      then print "Their new last name:"
      changed_variable = gets.chomp
    when 3
      then print "Their new email:"
      changed_variable = gets.chomp
    when 4
      then print "Their new note:"
      changed_variable = gets.chomp
    else
      puts "That was not a proper response."
    end
   @rolodex.modify_contact(contact_to_modify, answer, changed_variable) 

  end

  def display_contacts
    @rolodex.contacts.each {|key, value| puts value }
  end

  def display_contact
    display_contact = search_contacts
    puts "#{@rolodex.contacts[display_contact]}"
  end

  def display_attribute
    contact_to_view = search_contacts
    puts "Which attribute would you like to see?"
    puts "[1] First Name."
    puts "[2] Last Name."
    puts "[3] Email."
    puts "[4] Note."
    attribute = gets.chomp.to_i

    case attribute
    when 1
      then puts "First Name: #{@rolodex.display_attribute(contact_to_view, attribute)}"
    when 2
      then puts "Last Name: #{@rolodex.display_attribute(contact_to_view, attribute)}"
    when 3
      then puts "Email: #{@rolodex.display_attribute(contact_to_view, attribute)}"
    when 4
      then puts "Note: #{@rolodex.display_attribute(contact_to_view, attribute)}"
    end
  end

  def delete_contact
    contact = search_contacts
    puts "#{@rolodex.contacts[contact]} Would you like to delete this contact?[Yes/No]"
    answer = gets.chomp.downcase
    case answer
    when "yes"
      then
      @rolodex.delete_contact(contact)
      puts "Contact has been deleted."
    when "no"
      then puts "Contact will not be deleted."
    else
      puts "Incorrect option. Please try again."
    end
  end

end
bitmaker = CRM.new("BitmakerLabs CRM")

bitmaker.main_menu