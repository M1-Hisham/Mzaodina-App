class AuctionModel {
  Auction? auction;

  AuctionModel({this.auction});

  AuctionModel.fromJson(Map<String, dynamic> json) {
    auction =
        json['auction'] != null ? Auction.fromJson(json['auction']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (auction != null) {
      data['auction'] = auction!.toJson();
    }
    return data;
  }
}

class Auction {
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
  Product? product;

  Auction({
    this.id,
    this.slug,
    this.status,
    this.openingAmount,
    this.type,
    this.requiredBidders,
    this.currentBidders,
    this.isRegister,
    this.registrationAmount,
    this.auctionDurationMinutes,
    this.auctionStartRate,
    this.productSku,
    this.product,
  });

  Auction.fromJson(Map<String, dynamic> json) {
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
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['status'] = status;
    data['opening_amount'] = openingAmount;
    data['type'] = type;
    data['required_bidders'] = requiredBidders;
    data['current_bidders'] = currentBidders;
    data['isRegister'] = isRegister;
    data['registration_amount'] = registrationAmount;
    data['auction_duration_minutes'] = auctionDurationMinutes;
    data['auction_start_rate'] = auctionStartRate;
    data['product_sku'] = productSku;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? nameAr;
  String? keywords;
  String? productDetails;
  int? price;
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
