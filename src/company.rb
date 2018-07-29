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

class Position
  attr_reader :val

  private

    def self.new(val)
      @val = val
    end

  public

    def self.junior
      self.new(1)
    end

    def self.middle
      self.new(2)
    end

    def self.senior
      self.new(3)
    end

    def self.team_leader
      self.new(4)
    end

    def self.architect
      self.new(5)
    end

    def self.cto
      self.new(100)
    end

    def <=>(other)
      val <=> other.val
    end
end
