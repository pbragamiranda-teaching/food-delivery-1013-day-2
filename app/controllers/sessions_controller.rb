require_relative "../views/session_view.rb"

class SessionsController
  def initialize(employees_repository)
    @employees_repository = employees_repository
    @session_view = SessionView.new
  end

  def login
    # ask the user for his/hers username
    username = @session_view.ask_for("username")
    # ask the user for his/hers password
    password = @session_view.ask_for("password")
    # check the credentials
    employee = @employees_repository.find_by_username(username)
    # if right credentials
    if employee && employee.password == password
      #  welcome
      @session_view.login_sucessful
      employee
    else
      #  wrong credentials
      @session_view.wrong_credentials
      login
    end
  end

end
