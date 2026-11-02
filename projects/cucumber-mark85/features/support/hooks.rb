require_relative './pages/signup.page'
require_relative './libs/database'

Before do
    @signup_page = SignupPage.new
    @database = Database.new
    @login_page = LoginPage.new
end
