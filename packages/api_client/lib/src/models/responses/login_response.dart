class LoginResponse {
  final int? status;
  final bool? success;
  final UserData? data;
  final String? accessToken;

  LoginResponse({
    this.status,
    this.success,
    this.data,
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      success: json['success'],
      data: json.containsKey('data') ? UserData.fromJson(json['data']) : null,
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'data': data?.toJson(),
      'access_token': accessToken,
    };
  }

  bool get isSuccess => success == true;
}

class UserData {
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final List<Tag> tags;
  final List<String> favoriteSocialMedia;
  final int salary;
  final String email;
  final String birthDate;
  final int gender;
  final UserType type;
  final String avatar;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      about: json['about'],
      tags: (json['tags'] as List).map((tag) => Tag.fromJson(tag)).toList(),
      favoriteSocialMedia: List<String>.from(json['favorite_social_media']),
      salary: json['salary'],
      email: json['email'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      type: UserType.fromJson(json['type']),
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      'tags': tags.map((tag) => tag.toJson()).toList(),
      'favorite_social_media': favoriteSocialMedia,
      'salary': salary,
      'email': email,
      'birth_date': birthDate,
      'gender': gender,
      'type': type.toJson(),
      'avatar': avatar,
    };
  }
}

class Tag {
  final int id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class UserType {
  final int code;
  final String name;
  final String niceName;

  UserType({
    required this.code,
    required this.name,
    required this.niceName,
  });

  factory UserType.fromJson(Map<String, dynamic> json) {
    return UserType(
      code: json['code'],
      name: json['name'],
      niceName: json['nice_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'nice_name': niceName,
    };
  }
}
