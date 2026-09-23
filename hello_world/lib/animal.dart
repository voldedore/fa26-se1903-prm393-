// interface
abstract class Printable {
  void printInfo();
}

class Animal {
  String name;

  Animal(this.name);
}

mixin Flyable {
  void fly() {
    print("Flying...");
  }
}

mixin Swimmable {
  void swim() {
    print("Swimming...");
  }
}

class Duck extends Animal with Flyable, Swimmable implements Printable {
  int age;


  // Duck(this.age);
  Duck(String name, this.age) : super(name);

  @override
  void printInfo() {
    print("Duck $name, $age");
  }
}