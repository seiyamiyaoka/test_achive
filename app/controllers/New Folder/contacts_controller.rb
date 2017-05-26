class ContactsController < ApplicationController
#  def index
#  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    #Contact.create(contacts_params)
    @contact = Contact.new(contacts_params)
    if @contact.save
       redirect_to contacts_path, notice:"お問い合わせありがとうございました"
    else
       render 'new'
    end  
    
  end
  
  def update
     @contact.find(params[:id])
     @contact.update(blogs_params)
  end
  
  def confirm
  end
  
   private 
    def contacts_params
      params.require(:contact).permit(:name, :content, :email)
    end
end
