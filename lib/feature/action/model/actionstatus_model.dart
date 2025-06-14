class MaxBid {
  int? id;
  int? bid;
  User? user;

  MaxBid({this.id, this.bid, this.user});

  factory MaxBid.fromJson(Map<String, dynamic> json) {
    return MaxBid(
      id: json['id'],
      bid: json['bid'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'bid': bid, 'user': user?.toJson()};
  }
}

class User {
  int? id;
  String? username;
  String? country;

  User({this.id, this.username, this.country});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'country': country};
  }
}
