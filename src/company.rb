class Company
  def emails_by_highest_position(employees, limit)
    [employees.first.email]
  end
end

class Employee
  attr_reader :email

  def initialize(position, email)
    @email = email
  end
end
