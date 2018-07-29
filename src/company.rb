class Company
  def emails_by_highest_position(employees, limit)
    employee = employees[0]
    if employees.size > 1
      if employees.size > 2
        if employees[2].position > employee.position
          return [employees[2].email]
        end
      end
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

module Position
  JUNIOR = 1
  MIDDLE = 2
  CTO = 100
end
