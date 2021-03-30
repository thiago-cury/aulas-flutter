import 'dart:math';

class Person {

  String name;
  double weight;
  double height;

  Person(this.name, this.weight, this.height);

  double calculateIMC() {
    // var imc = weight /  (height * height);
    var imc = this.weight / pow(this.height, 2); //power - potenciacao
    print('IMC ${imc}');
    return imc;
  }

  @override
  String toString() {
    return 'Nome: $name\nPeso: $weight\nAltura: $height\nIMC ${this.calculateIMC()}';
  }
}