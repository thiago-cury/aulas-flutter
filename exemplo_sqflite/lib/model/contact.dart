
class Contact {

  int id;
  String name;
  String email;
  String phone;

  Contact(this.name, this.email, this.phone);

  Contact.fromMap(Map map) {
    id = map['id_column'];
    name = map['name_column'];
    email = map['email_column'];
    phone = map['phone_column'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "name_column": name,
      "email_column": email,
      "phone_column": phone
    };
    if(id != null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, email: $email, phone: $phone}';
  }

}