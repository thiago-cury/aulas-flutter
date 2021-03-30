
class Person {

  String name;
  String lastname;
  int age;

  int calculateAgeInMonths() {
    return this.age * 12;
  }

  @override
  String toString() {
    return 'Person $name $lastname\n Idade $age\n Idade em meses: ${this.calculateAgeInMonths()}';
  }

}