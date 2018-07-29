class Company
  def emails_by_highest_position(employees, limit)
    employee = employees[0]
    if employees.size > 1
      if employees[1].position > employee.position
        return [employees[1].email]
      end
    end
    [employee.email]
  end
end

class Employee
  attr_reader :email, :position

  def initialize(position, email)
    @email = email
    @position = position
  end
end
