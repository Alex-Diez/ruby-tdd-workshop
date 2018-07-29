require 'pqueue'

class Company
  def emails_by_highest_position(employees, limit)
    employee_list = PQueue.new
    limit.times { |j| employee_list.push employees[j] }
    i = 1
    while employees.size > i
      employee = employee_list.pop
      if employees[i].position > employee.position
        employee_list.push employees[i]
      else
        employee_list.push employee
      end
      i += 1
    end
    employee_list.to_a.map { |emp| emp.email }
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
  SENIOR = 3
  TEAM_LEADER = 4
  ARCHITECT = 5
  CTO = 100
end
