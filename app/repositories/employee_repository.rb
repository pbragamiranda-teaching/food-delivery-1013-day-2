require "csv"
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    # reads the csv file and transform the data into Employee instances
    load_csv if File.exist?(@csv_file_path)
  end

  def all_riders
    @employees.select do |employee|
      employee.rider?
    end
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end
