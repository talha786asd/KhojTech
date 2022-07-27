 import 'dart:convert';

ResponseLoginModel responseLoginModelFromJson(String str) => ResponseLoginModel.fromJson(json.decode(str));

String responseLoginModelToJson(ResponseLoginModel data) => json.encode(data.toJson());

// class ResponseLoginModel {
//     ResponseLoginModel({
//         this.status,
//         this.mess,
//         this.user,
//     });

//     String? status;
//     String? mess;
//     User? user;

//     factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => ResponseLoginModel(
//         status: json["status"],
//         mess: json["mess"],
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "mess": mess,
//         "user": user!.toJson(),
//     };
// }

// class User {
//     User({
//         this.data,
//         this.id,
//         this.caps,
//         this.capKey,
//         this.roles,
//         this.allcaps,
//         this.filter,
//     });

//     Data? data;
//     int? id;
//     Caps? caps;
//     String? capKey;
//     List<String>? roles;
//     Allcaps? allcaps;
//     dynamic filter;

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         data: Data.fromJson(json["data"]),
//         id: json["ID"],
//         caps: Caps.fromJson(json["caps"]),
//         capKey: json["cap_key"],
//         roles: List<String>.from(json["roles"].map((x) => x)),
//         allcaps: Allcaps.fromJson(json["allcaps"]),
//         filter: json["filter"],
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data!.toJson(),
//         "ID": id,
//         "caps": caps!.toJson(),
//         "cap_key": capKey,
//         "roles": List<dynamic>.from(roles!.map((x) => x)),
//         "allcaps": allcaps!.toJson(),
//         "filter": filter,
//    };
// }

// class Allcaps {
//     Allcaps({
//         this.read,
//         this.level0,
//         this.subscriber,
//     });

//     bool? read;
//     bool? level0;
//     bool? subscriber;

//     factory Allcaps.fromJson(Map<String, dynamic> json) => Allcaps(
//         read: json["read"],
//         level0: json["level_0"],
//         subscriber: json["subscriber"],
//     );

//     Map<String, dynamic> toJson() => {
//         "read": read,
//         "level_0": level0,
//         "subscriber": subscriber,
//     };
// }

// class Caps {
//     Caps({
//         this.subscriber,
//     });

//     bool? subscriber;

//     factory Caps.fromJson(Map<String, dynamic> json) => Caps(
//         subscriber: json["subscriber"],
//     );

//     Map<String, dynamic> toJson() => {
//         "subscriber": subscriber,
//     };
// }

// class Data {
//     Data({
//         this.id,
//         this.userLogin,
//         this.userPass,
//         this.userNicename,
//         this.userEmail,
//         this.userUrl,
//         this.userRegistered,
//         this.userActivationKey,
//         this.userStatus,
//         this.displayName,
//     });

//     String? id;
//     String? userLogin;
//     String? userPass;
//     String? userNicename;
//     String? userEmail;
//     String? userUrl;
//     DateTime? userRegistered;
//     String? userActivationKey;
//     String? userStatus;
//     String? displayName;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["ID"],
//         userLogin: json["user_login"],
//         userPass: json["user_pass"],
//         userNicename: json["user_nicename"],
//         userEmail: json["user_email"],
//         userUrl: json["user_url"],
//         userRegistered: DateTime.parse(json["user_registered"]),
//         userActivationKey: json["user_activation_key"],
//         userStatus: json["user_status"],
//         displayName: json["display_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "ID": id,
//         "user_login": userLogin,
//         "user_pass": userPass,
//         "user_nicename": userNicename,
//         "user_email": userEmail,
//         "user_url": userUrl,
//         "user_registered": userRegistered!.toIso8601String(),
//         "user_activation_key": userActivationKey,
//         "user_status": userStatus,
//         "display_name": displayName,
//     };
// }
class ResponseLoginModel {
  String? status;
  String? mess;
  User? user;

  ResponseLoginModel({this.status, this.mess, this.user});

  ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mess = json['mess'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['mess'] = this.mess;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Data? data;
  int? iD;
  Caps? caps;
  String? capKey;
  List<String>? roles;
  Allcaps? allcaps;
  Null? filter;

  User(
      {this.data,
      this.iD,
      this.caps,
      this.capKey,
      this.roles,
      this.allcaps,
      this.filter});

  User.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    iD = json['ID'];
    caps = json['caps'] != null ? new Caps.fromJson(json['caps']) : null;
    capKey = json['cap_key'];
    roles = json['roles'].cast<String>();
    allcaps =
        json['allcaps'] != null ? new Allcaps.fromJson(json['allcaps']) : null;
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['ID'] = this.iD;
    if (this.caps != null) {
      data['caps'] = this.caps!.toJson();
    }
    data['cap_key'] = this.capKey;
    data['roles'] = this.roles;
    if (this.allcaps != null) {
      data['allcaps'] = this.allcaps!.toJson();
    }
    data['filter'] = this.filter;
    return data;
  }
}

class Data {
  String? iD;
  String? userLogin;
  String? userPass;
  String? userNicename;
  String? userEmail;
  String? userUrl;
  String? userRegistered;
  String? userActivationKey;
  String? userStatus;
  String? displayName;

  Data(
      {this.iD,
      this.userLogin,
      this.userPass,
      this.userNicename,
      this.userEmail,
      this.userUrl,
      this.userRegistered,
      this.userActivationKey,
      this.userStatus,
      this.displayName});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userLogin = json['user_login'];
    userPass = json['user_pass'];
    userNicename = json['user_nicename'];
    userEmail = json['user_email'];
    userUrl = json['user_url'];
    userRegistered = json['user_registered'];
    userActivationKey = json['user_activation_key'];
    userStatus = json['user_status'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['user_login'] = this.userLogin;
    data['user_pass'] = this.userPass;
    data['user_nicename'] = this.userNicename;
    data['user_email'] = this.userEmail;
    data['user_url'] = this.userUrl;
    data['user_registered'] = this.userRegistered;
    data['user_activation_key'] = this.userActivationKey;
    data['user_status'] = this.userStatus;
    data['display_name'] = this.displayName;
    return data;
  }
}

class Caps {
  bool? subscriber;

  Caps({this.subscriber});

  Caps.fromJson(Map<String, dynamic> json) {
    subscriber = json['subscriber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriber'] = this.subscriber;
    return data;
  }
}

class Allcaps {
  bool? read;
  bool? level0;
  bool? subscriber;

  Allcaps({this.read, this.level0, this.subscriber});

  Allcaps.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    level0 = json['level_0'];
    subscriber = json['subscriber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read'] = this.read;
    data['level_0'] = this.level0;
    data['subscriber'] = this.subscriber;
    return data;
  }
}
