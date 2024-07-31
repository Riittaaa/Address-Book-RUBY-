Class Contact
  attr_accessor :name, :phone,:address, :email

  def initialize(name, phone, address, email)
    @name = name
    @phone = phone
    @address = address
    @email = email
  end

  def to_hash
    {"name" => @name, "phone_number" => @phone, "address_location" => @address, "email" => @email}
  end

  # def
  # end

  def to_string
    "Name: #{@name}, Phone Number: #{@phone}, Address: #{@address}, Email: #{@email}"
  end

  # def update_address(name: nil, phone: nil,address: nil, email: nil)
  #   @name = name if name
  #   @phone = phone if phone
  #   @address = address if address
  #   @email = email if email
  # end

end

Class AddressBook
  def initialize
    @contacts = []
  end

  def add_contact(contact)
    @contacts << contact   
  end

  def remove_contact(name)
   @contacts.delete_if {|contact| contact.name == name}
  end

  def update_contact(name, update_contact)
    contact = @contacts.find {|c| c.name == name}
    contact.update(
      name: updated_contact.name,
      phone: updated_contact.phone,
      email: updated_contact.email,
      address: updated_contact.address
    ) if contact
  end

  def display_contacts
      @contacts.each {|contact| contact.display}
  end

  def search_contacts(name)
    contact = @contacts.find {|c| c.name == name}
    contact.display if contact
  end


end

def main

  address_book = AddressBook.new
  loop do
    puts "\nAddress Book"
    puts "1. Add a contact"
    puts "2. Delete a contact"
    puts "3. Display all contacts"
    puts "4. Update a contact"
    puts "5. Exit"
    puts "\nEnter your choice: "

    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Enter the name: "
      name = gets.chomp
      puts "Enter phone number: "
      phone = gets.chomp
      puts "Enter the address: "
      address = gets.chomp
      puts "Enter the email: "
      email =gets.chomp

      contact = Contact.new(name, phone, address, email)
      address_book.add_contact(contact)

    end

    when 2
      puts "Enter the name of the contact to be removed: "
      name = gets.chomp

      address_book.remove_contact(name)
    end

    when 3
      address_book.display_contacts
    end

    when 4
      puts "Enter the name of the contact to be updated: "
      name = gets.chomp
      puts "Enter new phone (leave blank to keep current): "
      phone = gets.chomp
      puts "Enter new address (leave blank to keep current): "
      address = gets.chomp
      puts "Enter new email (leave blank to keep current): "
      email = gets.chomp

      updated_contact = Contact.new(name, phone.empty? ? nil : phone, email.empty? ? nil : email, address.empty? ? nil : address)
      address_book.update_contact(name, updated_contact)
    end

    when 5
      puts "Enter the name to search:"
      name = gets.chomp

      address_book.search_contacts(name)
    end

    when 6
      break
    end

    else
      puts "Invalid option! Try again!!"
    end
  end 
end


main
