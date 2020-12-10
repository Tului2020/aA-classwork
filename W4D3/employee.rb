class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier    
    end


end


class Manager < Employee

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        total_salaries = @employees.inject(0) { |acc, e| acc + e.salary}
        total_salaries * multiplier
    end

    def add_employee(employee)
      if employee.is_a?(Array)
        @employees += employee
      else
        @employees << employee
      end
    end

end


ned = Employee.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.add_employee([shawna, david])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000