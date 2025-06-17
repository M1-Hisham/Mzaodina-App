class AuctionModel {
  bool? status;
  String? message;
  Data? data;

  AuctionModel({this.status, this.message, this.data});

  AuctionModel.fromJson(Map<String, dynamic> json) {
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
  List<Auctions>? auctions;
  Meta? meta;

  Data({this.auctions, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['auctions'] != null) {
      auctions = <Auctions>[];
      json['auctions'].forEach((v) {
        auctions!.add(Auctions.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (auctions != null) {
      data['auctions'] = auctions!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Auctions {
  int? id;
  String? slug;
  String? status;
  int? openingAmount;

  String? type;
  int? requiredBidders;
  int? currentBidders;
  bool? isRegister;
  int? registrationAmount;
  int? auctionDurationMinutes;
  int? auctionStartRate;
  String? productSku;
  String? startAt;

  bool? canBidding;
  String? endAt;

  Product? product;
  Winner? winner;
  MaxBid? maxBid;

  Auctions({
    this.id,
    this.slug,
    this.status,
    this.openingAmount,
    this.canBidding,
    this.endAt,
    this.type,
    this.requiredBidders,
    this.currentBidders,
    this.isRegister,
    this.registrationAmount,
    this.auctionDurationMinutes,
    this.auctionStartRate,
    this.productSku,
    this.startAt,
    this.product,
    this.winner,
    this.maxBid,
  });

  Auctions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    status = json['status'];
    openingAmount = json['opening_amount'];
    type = json['type'];
    requiredBidders = json['required_bidders'];
    currentBidders = json['current_bidders'];
    isRegister = json['isRegister'];
    registrationAmount = json['registration_amount'];
    auctionDurationMinutes = json['auction_duration_minutes'];
    auctionStartRate = json['auction_start_rate'];
    productSku = json['product_sku'];
    startAt = json['start_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    canBidding = json['canBidding'];
    endAt = json['end_at'];
    winner = json['winner'] != null ? Winner.fromJson(json['winner']) : null;
    maxBid = json['max_bid'] != null ? MaxBid.fromJson(json['max_bid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['status'] = status;
    data['opening_amount'] = openingAmount;
    data['required_bidders'] = requiredBidders;
    data['current_bidders'] = currentBidders;
    data['isRegister'] = isRegister;
    data['registration_amount'] = registrationAmount;
    data['auction_duration_minutes'] = auctionDurationMinutes;
    data['auction_start_rate'] = auctionStartRate;
    data['product_sku'] = productSku;
    data['start_at'] = startAt;
    data['canBidding'] = canBidding;
    data['end_at'] = endAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (maxBid != null) {
      data['max_bid'] = maxBid!.toJson();
    }
    if (winner != null) {
      data['winner'] = winner!.toJson();
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

class Winner {
  int? id;
  String? invoicePrice;
  User? user;

  Winner({this.id, this.invoicePrice, this.user});

  Winner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoicePrice = json['invoice_price'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_price'] = invoicePrice;
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

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
