module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def link_to_sign_in
    if @current_user
      link_to @current_user.email, destroy_user_session_path, method: :delete, title: 'Выйти'
    else
      link_to 'Вход', '#', 'data-toggle' => "modal", 'data-target' => ".login-modal"
    end
  end
end
