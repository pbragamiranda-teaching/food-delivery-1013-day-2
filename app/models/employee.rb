# id, username, password, role
class Employee
  attr_reader :username, :password

  def initialize(attr={})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def manager?
    @role == "manager"
  end
end
