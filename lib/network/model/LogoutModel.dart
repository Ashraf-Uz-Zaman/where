class LogoutModel {
  Data? data;
  int? code;
  String? message;
  bool? isSuccess;

  LogoutModel({ this.data,  this.code,  this.message,  this.isSuccess});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    data =  Data.fromJson(json['data']);
    code = json['code'];
    message = json['message'];
    isSuccess = json['isSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    data['isSuccess'] = this.isSuccess;
    return data;
  }
}

class Data {


  Data();

  Data.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}