import 'dart:convert';

import 'package:exemplo_cep/model/model.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class CepService {

  Future<Cep> getCEP(String CEP) async {

    print('CEP: ${CEP.toString()}'); //91240000

    //https://api.postmon.com.br/v1/cep/91240090
    var url = Uri.https(Constant.baseUrl, Constant.apiVersion+Constant.endpointCep+CEP);

    var response = await http.get(url);

    if(response.statusCode != 200)
      throw Exception();

    print("body ${response.body}"); //retorno da API

    return parsedJson(response.body);
  }

  Cep parsedJson(final response) {
    return Cep.fromJson(json.decode(response));
  }


}