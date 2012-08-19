class Users::SessionsController < Devise::SessionsController
  layout "home"
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  # GET /resource/sign_in
  def new
    resource = build_resource(nil, :unsafe => true)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
      resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
    if request.format.html?
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      create_user(resource)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        head :no_content
      end
    end
  end

  def create_user(resource)
    authentication_token = resource.authentication_token
    resource.reset_authentication_token! if authentication_token.nil?
      resource.save
    respond_to do |format|
      #~ format.xml{ render :xml=>find_user(resource) ,:root => :user}
      format.json{render :json => find_user(resource)}
      format.xml{render :xml => find_user(resource).to_xml}
    end
  end

  def find_user(resource)
    {:user => resource.serializable_hash(:only => [:id, :authentication_token])}.merge(success)
  end

  protected

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end
end

