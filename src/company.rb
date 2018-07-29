require 'pqueue'

class Company
  def emails_by_highest_position(employees, limit)
    queue = PQueue.new(&Employee.by_position_asc)
    limit.times { |j| queue.push employees[j] }
    i = limit
    while employees.size > i
      employee = queue.pop
      if employees[i].position > employee.position
        queue.push employees[i]
      else
        queue.push employee
      end
      i += 1
    end
    queue.to_a.map { |emp| emp.email }
  end
end

class Employee
  attr_reader :email, :position

  def initialize(position, email)
    @email = email
    @position = position
  end

  def self.by_position_asc
    lambda { |emp1, emp2| emp2.position <=> emp1.position }
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
