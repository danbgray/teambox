class ApiV1::UsersController < ApiV1::APIController
  before_filter :find_user, :only => [ :show ]
  skip_before_filter :load_project
  
  def index
  end

  def show
    projects_shared = @user.projects_shared_with(@current_user)
    shares_invited_projects = projects_shared.empty? && @user.shares_invited_projects_with?(@current_user)
    
    if @user != @current_user and (!shares_invited_projects and projects_shared.empty?)
      return api_error(t('users.activation.invalid_user'), :unauthorized)
    end
    
    respond_to do |f|
      f.json  { render :as_json => @user.to_xml }
    end
  end

  protected
  
  def find_user
    unless @user = (User.find_by_login(params[:id]) || User.find_by_id(params[:id]) )
      api_error(t('not_found.user'), :not_found)
    end
  end
  
end