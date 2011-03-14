class ContactFormsController < ApplicationController
  #include SimpleCaptcha::ControllerHelpers

  def new
    @contact_form = ContactForm.new
  end
  
  def create
    @contact_form = ContactForm.new(params[:contact_form])
    #if simple_captcha_valid? &&
    if verify_recaptcha(:model => @contact_form, :attribute => :recaptcha, :message => "doesn't match, please try again") && 
        @contact_form.save
      #redirect_to root_url, :notice => "Message sent! Thank you for contacting us."
      redirect_to thanks_path
    else
      render :action => 'new'
    end
  end
  
  def thanks
    render
  end
end