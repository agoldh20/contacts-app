class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
     
  end

  def create
    contacts = Contact.new(
                          first_name: params[:first_name],
                          last_name: params[:last_name],
                          middle_name: params[:middle_name],
                          email: params[:email],
                          phone_number: params[:phone_number]
                          )
    contacts.save
    flash[:success] = "New Contact Created"
    redirect_to "/contacts/#{contacts.id}"
   end

   def show
     @contact = Contact.find(params[:id])
   end

   def edit
     @contact = Contact.find(params[:id])
   end

   def update
     contact = Contact.find(params[:id])

     contact.assign_attributes(
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          phone_number: params[:phone_number]
                          )
    contact.save
    flash[:success] = "Upated Complete"
    redirect_to "/contacts/#{contact.id}"
   end

   def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    flash[:danger] = "#{contact.first_name} #{contact.last_name} has been removed"
    redirect_to "/"
   end
end

