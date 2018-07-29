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

  private

    def junior
      Employee.new(Position::JUNIOR, "junior@company.com")
    end

    def middle
      Employee.new(Position::MIDDLE, "middle@company.com")
    end

    def cto
      Employee.new(Position::CTO, "cto@company.com")
    end
end
