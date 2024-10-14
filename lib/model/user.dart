part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;
  static String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? houseNumber,
    String? phoneNumber,
    String? city,
    String? picturePath,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      address: data['address'],
      houseNumber: data['houseNumber'],
      phoneNumber: data['phoneNumber'],
      city: data['city'],
      picturePath: data['profile_photo_url']);

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.id,
        this.name,
        this.email,
        this.address,
        this.houseNumber,
        this.phoneNumber,
        this.city,
        this.picturePath,
      ];
}

User mockUser = User(
    id: 1,
    name: 'Kahvechoyys',
    email: 'kahveci@gmail.com',
    address: 'Jl. Stadion',
    houseNumber: 'F17',
    phoneNumber: '08123456789',
    city: 'Duri',
    picturePath:
        'https://i.pinimg.com/474x/06/50/3f/06503f6ffc43497e4012919186afbf4a.jpg');
