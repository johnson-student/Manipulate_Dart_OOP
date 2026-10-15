enum Skill { FLUTTER, DART, OTHER }
class Address {
  String _street;
  String city;
  String zipCode;
  Address(this._street, this.city, this.zipCode);

  void printAddress() {
    print('Address: $_street, $city, $zipCode');
  }
}

class Employee {
  // Private fields
  String _name;
  double _baseSalary;
  List<Skill> _skills = [];
  Address _address;
  int _yearsOfExperience = 0;
  // Constructor
  Employee(this._name, this._baseSalary , this._skills, this._address, this._yearsOfExperience);
  Employee.mobileDeveloper(this._name, this._baseSalary , this._address, this._yearsOfExperience) {
     _skills.add(Skill.FLUTTER);
     _skills.add(Skill.DART);
  }
  //getters
  String get name => _name;
  double get baseSalary => _baseSalary;   
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
  
  double computeSalary() {
    double bonusSalary = baseSalary;
    for(int i = 0 ; i < _yearsOfExperience; i++){
      bonusSalary += 2000.0;
    }
    _skills?.forEach((skill) {
      if (skill == Skill.FLUTTER {
        bonusSalary += 5000.0;
      } else if( skill == Skill.DART)){
        bonusSalary += 3000.0;
      } else {
        bonusSalary += 1000.0;
      }
    });
    return bonusSalary;
  }
  
  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Skills: $_skills, Address: ${_address._street}, Years of Experience: $_yearsOfExperience');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
}