//Muxammadxon Asrorov
//PU220071

// 1. Classes
//1.1 - done
//1.2
class Book {
  String title;
  String author;
  int numberOfPages;

  Book(this.title, this.author, this.numberOfPages);

  void displayInfo() {
    print('Book: $title by $author, $numberOfPages pages');
  }
}

void main() {
  var myBook = Book('White Fang', 'Jack London', 400);
  myBook.displayInfo();
}



//1.3
class Student {
  String name;
  int age;
  List<double> grades;

  Student(this.name, this.age, this.grades);

  double calculateAverageGrade() {
    if (grades.isEmpty) return 0;
    return grades.reduce((a, b) => a + b) / grades.length;
  }
}

void main() {
  var student = Student('Bobur', 20, [90, 85, 78, 92]);
  print('Average grade: ${student.calculateAverageGrade()}');
}



//1.4
class BankAccount {
  int accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (balance - amount < 0) {
      print('Error: Insufficient funds!');
    } else {
      balance -= amount;
      print('Withdrew: \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}');
    }
  }
}

void main() {
  var account = BankAccount(12345, 'Artur', 100.0);
  account.deposit(50);
  account.withdraw(30);
  account.withdraw(150);
}



//1.5
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height;
  double get perimeter => 2 * (width + height);
}

void main() {
  var rect = Rectangle(5, 10);
  print('Area: ${rect.area}');
  print('Perimeter: ${rect.perimeter}');
}



//------------------------------------------
//------------------------------------------
//------------------------------------------



// 2. Enums
//2.1 - done
//2.2
enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled
}

void main() {
  OrderStatus status = OrderStatus.processing;
  print('Order status: $status');
}



//2.3
enum TrafficLight {
  red,
  yellow,
  green
}

String getAction(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      return "Stop";
    case TrafficLight.yellow:
      return "Caution";
    case TrafficLight.green:
      return "Go";
  }
}

void main() {
  for (var light in TrafficLight.values) {
    print("Light: $light → Action: ${getAction(light)}");
  }
}



//2.4
enum UserRole { admin, editor, guest }

class User {
  String name;
  UserRole role;

  User(this.name, this.role);

  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

void main() {
  User user1 = User("Anvar", UserRole.admin);
  User user2 = User("Bobur", UserRole.editor);
  User user3 = User("Davron", UserRole.guest);

  print("${user1.name} can edit: ${user1.hasEditPermission()}");
  print("${user2.name} can edit: ${user2.hasEditPermission()}");
  print("${user3.name} can edit: ${user3.hasEditPermission()}");
}



//2.5
enum TrafficLight {
  red(30),
  yellow(5),
  green(45);

  final int durationInSeconds;
  const TrafficLight(this.durationInSeconds);
}

void main() {
  for (var light in TrafficLight.values) {
    print("Light: $light → Duration: ${light.durationInSeconds} seconds");
  }
}



//------------------------------------------
//------------------------------------------
//------------------------------------------



// 3. Inheritans
//3.1 - done
//3.2
class Animal {
  void makeSound() {
    print("Some animal sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

void main() {
  var dog = Dog();
  var cat = Cat();
  dog.makeSound();
  cat.makeSound();
}



//3.3
class Shape {
  String color;

  Shape(this.color);
}

class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;

  Square(String color, this.sideLength) : super(color);
}

void main() {
  var circle = Circle("Red", 5.0);
  var square = Square("Blue", 3.0);
  print("Circle color: ${circle.color}, radius: ${circle.radius}");
  print("Square color: ${square.color}, side: ${square.sideLength}");
}



//3.4
class Employee {
  String name;
  double baseSalary;

  Employee(this.name, this.baseSalary);

  double calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);

  @override
  double calculateSalary() {
    return baseSalary + bonus;
  }
}

void main() {
  var emp = Employee("Anvar", 3000);
  var mgr = Manager("Bobur", 4000, 1000);

  print("${emp.name}'s Salary: \$${emp.calculateSalary()}");
  print("${mgr.name}'s Salary: \$${mgr.calculateSalary()}");
}



//3.5
class LibraryItem {
  String title;
  int id;

  LibraryItem(this.title, this.id);

  String getDetails() {
    return "Title: $title, ID: $id";
  }
}

class Book extends LibraryItem {
  String author;

  Book(String title, int id, this.author) : super(title, id);

  @override
  String getDetails() {
    return "Book - ${super.getDetails()}, Author: $author";
  }
}

class DVD extends LibraryItem {
  String director;

  DVD(String title, int id, this.director) : super(title, id);

  @override
  String getDetails() {
    return "DVD - ${super.getDetails()}, Director: $director";
  }
}

void main() {
  var book = Book("Dart Programming", 1, "Jane Doe");
  var dvd = DVD("Learn Dart", 2, "John Smith");

  print(book.getDetails());
  print(dvd.getDetails());
}



//------------------------------------------
//------------------------------------------
//------------------------------------------


// 4. Mixins
//4.1 - done
//4.2
mixin Flyer {
  void fly() {
    print("Taking off!");
  }
}

class Bird with Flyer {}

class Plane with Flyer {}

void main() {
  var bird = Bird();
  var plane = Plane();
  
  bird.fly();
  plane.fly();
}



//4.3
mixin Logger {
  void log(String message) {
    print("[LOG]: $message");
  }
}

class DataService with Logger {
  void fetchData() {
    log("Fetching data");
  }
}

void main() {
  var service = DataService();
  service.fetchData();
}



//4.4
mixin Validator {
  bool isEmailValid(String email) => email.contains('@');
  bool isPasswordStrong(String password) => password.length >= 8;
}

class UserSignup with Validator {
  void validate(String email, String password) {
    print("Email valid: ${isEmailValid(email)}");
    print("Password strong: ${isPasswordStrong(password)}");
  }
}

void main() {
  var user = UserSignup();
  user.validate("test@example.com", "secure123");
}



//4.5
mixin Performer {
  void perform() {
    print("Performing on stage!");
  }
}

mixin Musician {
  void playInstrument() {
    print("Playing guitar!");
  }
}

class Artist {}

class Dancer extends Artist with Performer {}

class Guitarist extends Artist with Performer, Musician {}

void main() {
  var dancer = Dancer();
  var guitarist = Guitarist();

  dancer.perform();
  guitarist.perform();
  guitarist.playInstrument();
}

