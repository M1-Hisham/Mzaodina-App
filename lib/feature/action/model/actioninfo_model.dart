class ActioninfoModel {
  bool? status;
  String? message;
  Data? data;

  ActioninfoModel({this.status, this.message, this.data});

  ActioninfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? slug;
  String? status;
  int? openingAmount;
  bool? canBidding;
  String? endAt;
  Product? product;
  MaxBid? maxBid;

  Data({
    this.id,
    this.slug,
    this.status,
    this.openingAmount,
    this.canBidding,
    this.endAt,
    this.product,
    this.maxBid,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    status = json['status'];
    openingAmount = json['opening_amount'];
    canBidding = json['canBidding'];
    endAt = json['end_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    maxBid = json['max_bid'] != null ? MaxBid.fromJson(json['max_bid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['status'] = status;
    data['opening_amount'] = openingAmount;
    data['canBidding'] = canBidding;
    data['end_at'] = endAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (maxBid != null) {
      data['max_bid'] = maxBid!.toJson();
    }
    return data;
  }
}

class Product {
  String? nameAr;
  String? keywords;
  String? productDetails;
  String? price;
  int? weight;
  List<String>? images;

  Product({
    this.nameAr,
    this.keywords,
    this.productDetails,
    this.price,
    this.weight,
    this.images,
  });

  Product.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    keywords = json['keywords'];
    productDetails = json['product_details'];
    price = json['price'];
    weight = json['weight'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_ar'] = nameAr;
    data['keywords'] = keywords;
    data['product_details'] = productDetails;
    data['price'] = price;
    data['weight'] = weight;
    data['images'] = images;
    return data;
  }
}

class MaxBid {
  int? id;
  int? bid;
  User? user;

  MaxBid({this.id, this.bid, this.user});

  MaxBid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bid = json['bid'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bid'] = bid;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? country;

  User({this.id, this.username, this.country});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['country'] = country;
    return data;
  }
}
