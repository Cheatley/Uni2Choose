class ContactsController < ApplicationController
  
    def new
      add_crumb "Home", '/'
      add_crumb "Contact Us", contacts_path, links: false
      @contact = Contact.new
    end
  
    def create
      add_crumb "Home", '/'
      add_crumb "Contact Us", contacts_path, links: false
      @contact = Contact.new(params[:contact])
      @contact.request = request
      
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
        
      else
        flash.now[:error] = 'Cannot send message.'
        render :new
        
      end
    end

end