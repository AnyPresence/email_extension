class EmailOptionsController < ApplicationController
  before_filter :find_available_objects, :except => [:index, :destroy]

  def index
    @email_options = current_account.email_options
  end
  
  def new
    @email_option = current_account.email_options.build
    email_options = current_account.email_options.all
    email_options.each do |x|
      @available_objects.delete(x.name)
    end
  end
  
  def create
    @email_option = current_account.email_options.build(params[:email_option])
    
    if @email_option.save
      flash[:notice] = "Email option has been created."
      redirect_to [current_account, @email_option]
    else
      flash[:alert] = "Email option has not been created."
      render "new"
    end
  end
  
  def edit
    @email_option = EmailOption.find(params[:id])
  end  
  
  def update
    @email_option =  EmailOption.find(params[:id])
    if @email_option.update_attributes(params[:email_option])
      flash[:notice] = "Email option has been updated."
      redirect_to [current_account, @email_option]
    else
      flash[:alert] = "Email option has not been updated."
      render :action => "edit"
    end
  end
  
  def show
    @email_option = EmailOption.find(params[:id])
  end
  
  def destroy
    @email_option = current_account.email_options.find(params[:id])
    @email_option.destroy
    flash[:notice] = "Email option has been deleted."
    redirect_to settings_path
  end
end
