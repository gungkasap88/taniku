class respon_login_model {
  bool? isSuccess;
  String? message;
  Data? data;
  String? error;

  respon_login_model({this.isSuccess, this.message, this.data, this.error});

  respon_login_model.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  factory respon_login_model.withError(String error) => respon_login_model(error: error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? username;
  String? name;
  String? imageProfile;
  String? loginType;
  String? typeUser;
  Detail? detail;
  String? token;
  Null? fcmToken;

  Data(
      {this.userId,
        this.username,
        this.name,
        this.imageProfile,
        this.loginType,
        this.typeUser,
        this.detail,
        this.token,
        this.fcmToken});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    imageProfile = json['image_profile'];
    loginType = json['login_type'];
    typeUser = json['type_user'];
    detail =
    json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    token = json['token'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['image_profile'] = this.imageProfile;
    data['login_type'] = this.loginType;
    data['type_user'] = this.typeUser;
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['token'] = this.token;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}

class Detail {
  int? petaniId;
  Null? latitude;
  Null? longitude;

  Detail({this.petaniId, this.latitude, this.longitude});

  Detail.fromJson(Map<String, dynamic> json) {
    petaniId = json['petani_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['petani_id'] = this.petaniId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
