
class Castle {

  String? name;
  String? location;

  Castle({required this.name, required this.location});

  //conversão....
  factory Castle.fromJson(Map<String, dynamic> json) {
    return Castle(
      name: json['name'] ?? null,
      location: json['location'] ?? 'Terra do nunca',
    );
  }


  @override
  String toString() {
    return 'Castle{name: $name, location: $location}';
  }
}

/*
[
  {
  "religion":["Faith of the Seven"],
  "rulers":["House Smallwood"],
  "founder":[],
  "_id":"5cc074e304e71a0010b85ba4",
  "name":null,
  "location":"Westeros",
  "type":"Castle","__v":0
  },
  {
  "religion":["Faith of the Seven"],
  "rulers":["House Smallwood"],
  "founder":[],
  "_id":"5cc074e304e71a0010b85ba4",
  "name":"Acorn Hall",
  "location":"Westeros",
  "type":"Castle","__v":0
  },
]
*/