
class Schedule {

  int? id;
  String? name;
  String? phone;
  String? date;
  String? hour;
  String? kindOfService;

  Schedule({this.name, this.phone, this.date, this.hour, this.kindOfService});

  //vai trazer do banco de dados
  Schedule.fromMap(Map map) {
    id = map['id_column'] ?? 0;
    name = map['name_column'];
    phone = map['phone_column'];
    date = map['date_column'];
    hour = map['hour_column'];
    kindOfService = map['kind_of_service_column'];
  }

  //mapear para o banco de dados.
  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      "name_column": name,
      "phone_column": phone,
      "date_column": date,
      "hour_column": hour,
      "kind_of_service_column": kindOfService
    };
    if(id != null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Schedule{id: $id, name: $name, phone: $phone, date: $date, hour: $hour, kindOfService: $kindOfService}';
  }
}