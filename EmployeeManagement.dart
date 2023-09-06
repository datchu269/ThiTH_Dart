
void main() {
  EmployeeManagement employeeManagement = EmployeeManagement();

  // insert
  Employee employee1 = Employee(1, "Nguyen Van A", "10-02-1999", "Ha Noi", "032222222222");
  Employee employee2 = Employee(2, "Nguyen Van B", "10-02-1999", "Ha Noi", "032222222223");
  Employee employee3 = Employee(3, "Nguyen Van C", "10-02-1998", "Ha Noi", "032222223333");
  employeeManagement.addNewEmployee(employee1);
  employeeManagement.addNewEmployee(employee2);
  employeeManagement.addNewEmployee(employee3);


  // list
  employeeManagement.showAllEmployee();

  // update
  Employee employeeNew = Employee.withoutId("Nguyen Van ABC", "10-02-2000", "Ha Noi", "032222222222");
  employeeManagement.updateEmployee(1, employeeNew);

  // list
  employeeManagement.showAllEmployee();
}

class Employee {
  int? id;
  String? fullName;
  String? birthday;
  String? address;
  String? phoneNumber;

  Employee(int id, String fullName, String birthday, String address, String phoneNumber) {
    this.id = id;
    this.fullName = fullName;
    this.birthday = birthday;
    this.address = address;
    this.phoneNumber = phoneNumber;
  }

  Employee.withoutId(String fullName, String birthday, String address, String phoneNumber) {
    this.fullName = fullName;
    this.birthday = birthday;
    this.address = address;
    this.phoneNumber = phoneNumber;
  }
 
}

class EmployeeManagement {
  List<Employee> employees = [];

  void addNewEmployee(Employee employee) {
    bool checkId = false;
    for (Employee e in employees) {
      if (e.id == employee.id) {
        checkId = true;
      }
    }
    if (!checkId) {
      employees.add(employee);
      print("Successfully");
    } else {
      print("Error: duplicate id");
    }
  }

  List<Employee> getAllEmployee() {
    return employees;
  }

  void updateEmployee(int id, Employee employeeNew) {
    int index = -1;
    int count = employees.length;
    for (var i = 0; i < count; i++) {
      if (employees[i].id == id) {
        index = i;
      }
    }
    if (index != -1) {
      employeeNew.id = id;
      employees[index] = employeeNew;
      print("Successfully");
    } else {
      print("Error: employee not found");
    }
  }

  void showAllEmployee() {
    print("All Employees:");
    for (Employee employee in employees) {
      print("ID: ${employee.id}, Full Name: ${employee.fullName}, Birthday: ${employee.birthday}, Address: ${employee.address}, Phone Number: ${employee.phoneNumber}");
    }
  }
}
