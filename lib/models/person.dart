class Person {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String imagePath;

  Person({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "imagePath": imagePath,
  };

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      imagePath: json['imagePath'],
    );
  }
}
