import 'package:mzaodina_app/feature/home/home_details/ongoing/data/model/auctions_bidding_history_model.dart';

class BidModel {
  final int number;
  final String name;
  final double amount;
  final DateTime dateTime;

  BidModel({
    required this.number,
    required this.name,
    required this.amount,
    required this.dateTime,
  });
}

List<BidModel> convertToBids(List<BiddingHistoryItem> dataList) {
  return dataList.asMap().entries.map((entry) {
    final index = entry.key;
    final item = entry.value;

    return BidModel(
      number: index + 1, // ترتيب المزايدة
      name: item.user.username,
      amount: item.bid.toDouble(),
      dateTime: DateTime.parse(item.time),
    );
  }).toList();
}
