
import 'dart:convert';
import 'package:exemplo_cep/constant.dart';
import 'package:exemplo_cep/model/model.dart';
import 'package:http/http.dart' as http;

class CepService {

  Future<Cep> getCEP({String CEP}) async {

    print("Cep ${CEP.toString()}");

    var url = Uri.https(Constant.BASE_URL, Constant.CEP_ENDPOINT + "$CEP");

    final response = await http.Client().get(url);

    if(response.statusCode != 200)
      throw Exception();

    print("body: ${response.body}");

    //decode......
    return parsedJson(response.body);
  }

  Cep parsedJson(final response) {
    final jsonDecode = json.decode(response);
    return Cep.fromJson(jsonDecode); //transforma o json de entrada em um objeto do tipo CEP
  }

}