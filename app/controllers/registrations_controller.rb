class RegistrationsController < Devise::RegistrationsController

	def new
    
    @role =  params[:role]
    (params[:role].include? ("client"))||(params[:role].include? ("candidate"))
    build_resource({})
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.save 
    UserMailer.candidate_email_alert(resource).deliver_now if resource.save
    UserMailer.candidate_email_alert(AdminUser.first).deliver_now if resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
    
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    
    # add custom create logic here
  end

  def update
    super
  end
end
