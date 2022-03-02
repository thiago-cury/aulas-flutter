import 'package:exemplo_api_game_of_thrones/constant.dart';
import 'package:exemplo_api_game_of_thrones/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GotService {

  Future<List<Castle>> fetchCastles() async {
    
    final url = Uri.https(Constant.baseUrl, '${Constant.baseUrlPath}${Constant.endPointCastles}');

    final response = await http.Client().get(
      url,
    );

    if(response.statusCode == 200) {
      print('${response.body.toString()}');

      List<dynamic> castles = json.decode(response.body);

      List<Castle> listCastles = castles.map((castle) => Castle.fromJson(castle)).toList();

      return listCastles;
    } else {
      return [];
    }
  }
  
}