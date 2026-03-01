class Person {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String imagePath;
  bool isFavorite = false;

  Person({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imagePath,
    required this.isFavorite,
  });

  Person copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? imagePath,
    bool? isFavorite,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "imagePath": imagePath,
    "isFavorite": isFavorite,
  };

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['objectId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      imagePath: json['imagePath'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
