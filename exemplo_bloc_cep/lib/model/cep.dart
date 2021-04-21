
class Cep {

  final district;
  final city;
  final address;
  final zipcode;
  final state;

  Cep(this.district, this.city, this.address, this.zipcode, this.state);

  String get getDistrict => district;
  String get getCity => city;
  String get getAddress => address;
  String get getZipcode => zipcode;
  String get getState => state;

  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      json['bairro'],
      json['cidade'],
      json['logradouro'],
      json['cep'],
      json['estado'],
    );
  }

  @override
  String toString() {
    return 'Cep{district: $district, city: $city, address: $address, zipcode: $zipcode, state: $state}';
  }
}

/*
{
"bairro": "Jardim Leopoldina",
"cidade": "Porto Alegre",
"logradouro": "Avenida Juscelino Kubitschek de Oliveira",
"estado_info": {"area_km2": "281.737,947", "codigo_ibge": "43", "nome": "Rio Grande do Sul"},
"cep": "91240090",
"cidade_info": {"area_km2": "496,682", "codigo_ibge": "4314902"},
"estado": "RS"
}
* */