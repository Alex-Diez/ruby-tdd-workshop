class Company
  def emails_by_highest_position(employees, limit)
    if limit == 1
      employee = employees[0]
      i = 1
      while employees.size > i
        if employees[i].position > employee.position
          employee = employees[i]
        end
        i += 1
      end
      [employee.email]
    else
      employee_list = []
      employee_list[0] = employees[0]
      employee_list[1] = employees[1]
      i = 1
      while employees.size > i
        if employees[i].position > employee_list[0].position
          employee_list[0] = employees[i]
        elsif employees[i].position > employee_list[1].position
          employee_list[1] = employees[i]
        end
        i += 1
      end
      employee_list.map { |emp| emp.email }
    end
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
