require 'rspec'
require 'company'

describe 'Company' do
  before(:each) do
    @company = Company.new
  end

  it 'extracts employee email from single employee list' do
    employees = [junior]
    emails = @company.emails_by_highest_position(employees, 1)
    expect(emails).to eq(["junior@company.com"])
  end

  it 'extracts employee email with highest position from list of two employees' do
    employees = [junior, middle]
    emails = @company.emails_by_highest_position(employees, 1)
    expect(emails).to eq(["middle@company.com"])
  end

  it 'extracts employee email with highest position from list of three employees' do
    employees = [cto, junior, middle]
    emails = @company.emails_by_highest_position(employees, 1)
    expect(emails).to eq(["cto@company.com"])
  end

  it 'extracts list of employee emails with highest position from list of three employees' do
    employees = [cto, junior, middle]
    emails = @company.emails_by_highest_position(employees, 2)
    expect(emails).to contain_exactly("middle@company.com", "cto@company.com")
  end

  it 'extracts list of employees emails with highest position from employees list with position duplications' do
    employees = [senior, senior, senior, team_leader, architect, cto]
    emails = @company.emails_by_highest_position(employees, 2)
    expect(emails).to contain_exactly("architect@company.com", "cto@company.com")
  end

  private

    def junior
      Employee.new(Position.junior, "junior@company.com")
    end

    def middle
      Employee.new(Position.middle, "middle@company.com")
    end

    def senior
      Employee.new(Position.senior, "senior@company.com")
    end

    def team_leader
      Employee.new(Position.team_leader, "team_leader@company.com")
    end

    def architect
      Employee.new(Position.architect, "architect@company.com")
    end

    def cto
      Employee.new(Position.cto, "cto@company.com")
    end
end
