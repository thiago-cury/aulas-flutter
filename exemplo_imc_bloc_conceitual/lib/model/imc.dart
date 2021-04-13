import 'dart:math';

class Imc {

  double weight;
  double height;

  Imc(this.weight, this.height);

  double calculate() {
    return weight / pow(height, 2);
  }
}