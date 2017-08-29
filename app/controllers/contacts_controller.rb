class ContactsController < ApplicationController
  def first_contact_action
    @contacts = Contact.first
    @title = "#{@contacts.last_name}, #{@contacts.first_name}"
    render 'first_contact_page.html.erb'
  end
end
