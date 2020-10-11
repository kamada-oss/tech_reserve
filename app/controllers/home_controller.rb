class HomeController < ApplicationController
  def top; end

  def test
    user = User.find_by(email: 'test@gmail.com')
    sign_in(user)
    redirect_to categories_index_path
  end
end
