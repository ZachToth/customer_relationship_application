class Rolodex
  attr_reader :contacts
  @@ids = 1

	def initialize
		@contacts = {}
	end

  def add_contact(contact)
    key = "#{@@ids}".to_sym
    @contacts[key] = contact
    @contacts[key]
    @@ids +=1
  end

  def modify_contact(contact_name, mod, changed_variable)
    contact_name = @contacts[contact_name]

    case mod
    when 1 then contact_name.first_name = changed_variable
    when 1 then contact_name.last_name = changed_variable
    when 1 then contact_name.email = changed_variable
    when 1 then contact_name.note = changed_variable
    end
  end

  def display_contacts
    @contacts
  end
  
  def delete_contact(contact)
    @contacts.delete(contact)
  end

  def display_attribute(contact, attribute)
    case attribute
    when 1
      then @contacts[contact].first_name
    when 2
      then @contacts[contact].last_name
    when 3
      then @contacts[contact].email
    when 4
      then @contacts[contact].note
    end
  end
end