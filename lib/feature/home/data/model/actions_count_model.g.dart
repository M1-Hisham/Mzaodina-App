// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionsCountModel _$ActionsCountModelFromJson(Map<String, dynamic> json) =>
    ActionsCountModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionsCountModelToJson(ActionsCountModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  notstart: NotStart.fromJson(json['notstart'] as Map<String, dynamic>),
  ready: Ready.fromJson(json['ready'] as Map<String, dynamic>),
  ongoing: Ongoing.fromJson(json['ongoing'] as Map<String, dynamic>),
  finished: Finished.fromJson(json['finished'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'notstart': instance.notstart,
  'ready': instance.ready,
  'ongoing': instance.ongoing,
  'finished': instance.finished,
};

NotStart _$NotStartFromJson(Map<String, dynamic> json) =>
    NotStart(total: (json['total'] as num).toInt());

Map<String, dynamic> _$NotStartToJson(NotStart instance) => <String, dynamic>{
  'total': instance.total,
};

Ready _$ReadyFromJson(Map<String, dynamic> json) =>
    Ready(total: (json['total'] as num).toInt());

Map<String, dynamic> _$ReadyToJson(Ready instance) => <String, dynamic>{
  'total': instance.total,
};

Ongoing _$OngoingFromJson(Map<String, dynamic> json) =>
    Ongoing(total: (json['total'] as num).toInt());

Map<String, dynamic> _$OngoingToJson(Ongoing instance) => <String, dynamic>{
  'total': instance.total,
};

Finished _$FinishedFromJson(Map<String, dynamic> json) =>
    Finished(total: (json['total'] as num).toInt());

Map<String, dynamic> _$FinishedToJson(Finished instance) => <String, dynamic>{
  'total': instance.total,
};
