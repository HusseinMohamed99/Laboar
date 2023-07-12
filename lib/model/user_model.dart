class UserModel {
  String fullName;
  String uId;
  String? image;
  String phone;
  String address;

  UserModel({
    this.uId = '',
    required this.fullName,
    this.image,
    required this.phone,
    this.address = '',
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          fullName: data['firstName'],
          image: data['image'],
          phone: data['phone'],
          address: data['address'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'fullName': fullName,
      'uId': uId,
      'image': image,
      'phone': phone,
      'address': address,
    };
  }
}
