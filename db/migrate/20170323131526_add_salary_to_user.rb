class AddSalaryToUser < ActiveRecord::Migration
  def change
    add_column :users, :salary_expectation, :string
  end
end
