require 'rspec'
require 'company'

describe 'Company' do
  it 'extracts employee email from single employee list' do
    company = Company.new
    employees = [Employee.new(:JUNIOR, "junior@company.com")]
    emails = company.emails_by_highest_position(employees, 1)
    expect(emails).to eq(["junior@company.com"])
  end
end
