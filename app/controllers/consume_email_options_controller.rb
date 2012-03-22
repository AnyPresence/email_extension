class ConsumeEmailOptionsController < ApplicationController
  before_filter :find_available_objects, :except => [:index, :destroy]

  def index
    @consume_email_options = current_account.consume_email_options
  end
  
  def new
    @consume_email_option = current_account.consume_email_options.build
    consume_email_options = current_account.consume_email_options.all
    consume_email_options.each do |x|
      @available_objects.delete(x.name)
    end
  end
  
  def create
    @consume_email_option = current_account.consume_email_options.build(params[:consume_email_option])
    
    if @consume_email_option.save
      flash[:notice] = "Consume email option has been created."
      redirect_to [current_account, @consume_email_option]
    else
      flash[:alert] = "Consume email option has not been created."
      render "new"
    end
  end
  
  def edit
    @consume_email_option = EmailOption.find(params[:id])
  end  
  
  def update
    @consume_email_option =  EmailOption.find(params[:id])
    if @consume_email_option.update_attributes(params[:consume_email_option])
      flash[:notice] = "Consume email option has been updated."
      redirect_to [current_account, @consume_email_option]
    else
      flash[:alert] = "Consume email option has not been updated."
      render :action => "edit"
    end
  end
  
  def show
    @consume_email_option = ConsumeEmailOption.find(params[:id])
  end
  
  def destroy
    @consume_email_option = current_account.consume_email_options.find(params[:id])
    @consume_email_option.destroy
    flash[:notice] = "Consume email option has been deleted."
    redirect_to settings_path
  end
end
