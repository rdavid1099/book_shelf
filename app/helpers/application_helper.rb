module ApplicationHelper
  def display_home_link
    if current_user.admin?
      "Welcome, #{link_to current_user.username, admin_books_path} | #{link_to "Logout", logout_path}"
    else
      "Welcome, #{link_to current_user.username, user_path(current_user)} | #{link_to "Logout", logout_path}"
    end
  end  
end
