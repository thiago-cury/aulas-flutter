
import 'package:ex_modular/app/app_module.dart';
import 'package:ex_modular/app/modules/other/other_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

void main() {

  initModules([AppModule(), OtherModule()]);

  test('get Controller', () {
    final controller1 = Modular.get<Controller>();
    final controller2 = Modular.get<Controller>();

    final controller3 = Modular.get<String>();

    final controller4 = Modular.get<ControllerWithInjection>();

    controller1.printText();
    controller1.printText();

    /* os valores do hash serão diferentes se utilizarmos factory no app_module.
    * caso seja chamado com singleton a instância será a mesma, ou seja, os valores de
    * hash serão iguais.
    * o lazy singleton só instancia após a primeira execução*/
    print(controller1.hashCode);
    print(controller2.hashCode);

    //vai imprimir só o nome
    print(controller3);

    //vai imprimir o nome que foi injetado automaticamente pelo modular.
    controller4.printText();
  });
}