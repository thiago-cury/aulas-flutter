class Todo {
  int? id;
  String? title;
  bool? done;

  Todo({this.id, this.title, this.done});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['done'] = done;
    return data;
  }

}
