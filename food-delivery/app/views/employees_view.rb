class EmployeesView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.role == 'manager' ? '👩‍💼' : '🛵'} #{employee.username}"
    end
  end
end
