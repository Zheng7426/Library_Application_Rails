class AddEmployee < ActiveRecord::Migration[6.0]
  def change
    User.create! do |u|
      u.email = 'test_employee@test.ca'
      u.password = 'abc123'
      u.employee_role = true
    end
  end
end
