
import 'package:json_annotation/json_annotation.dart';

part 'actions_count_model.g.dart';

@JsonSerializable()
class ActionsCountModel {
  final bool status;
  final String message;
  final Data data;

  ActionsCountModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ActionsCountModel.fromJson(Map<String, dynamic> json) =>
      _$ActionsCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActionsCountModelToJson(this);
}

@JsonSerializable()
class Data {
  final NotStart notstart;
  final Ready ready;
  final Ongoing ongoing;
  final Finished finished;

  Data({
    required this.notstart,
    required this.ready,
    required this.ongoing,
    required this.finished,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class NotStart {
  final int total;

  NotStart({required this.total});

  factory NotStart.fromJson(Map<String, dynamic> json) =>
      _$NotStartFromJson(json);

  Map<String, dynamic> toJson() => _$NotStartToJson(this);
}

@JsonSerializable()
class Ready {
  final int total;

  Ready({required this.total});

  factory Ready.fromJson(Map<String, dynamic> json) => _$ReadyFromJson(json);

  Map<String, dynamic> toJson() => _$ReadyToJson(this);
}

@JsonSerializable()
class Ongoing {
  final int total;

  Ongoing({required this.total});

  factory Ongoing.fromJson(Map<String, dynamic> json) =>
      _$OngoingFromJson(json);

  Map<String, dynamic> toJson() => _$OngoingToJson(this);
}

@JsonSerializable()
class Finished {
  final int total;

  Finished({required this.total});

  factory Finished.fromJson(Map<String, dynamic> json) =>
      _$FinishedFromJson(json);

  Map<String, dynamic> toJson() => _$FinishedToJson(this);
}
