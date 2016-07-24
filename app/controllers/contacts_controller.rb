class ContactsController < ApplicationController
    
    #Contact Us form: creates a new message
    def new
      #breadcrumbs
      add_crumb "Home", '/'
      add_crumb "Contact Us", contacts_path, links: false
      @contact = Contact.new
    end
    
    #Contact Us form: delivers the message and informs the user whether the message has been delivered or not
    def create
      #breadcrumbs
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