import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzaodina_app/feature/auction/model/actionstatus_model.dart';
import 'package:mzaodina_app/feature/auction/model/auctions_model.dart';
import 'package:mzaodina_app/feature/home/home_details/finished/ui/view_model/finished_cubit/finished_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ongoing/ui/view_model/ongoing_cubit/ongoing_cubit.dart';
import 'package:mzaodina_app/feature/home/home_details/ready/ui/view_model/ready_cubit/ready_cubit.dart';
import 'package:mzaodina_app/main.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'auction_state.dart';

class AuctionCubit extends Cubit<AuctionState> {
  AuctionCubit() : super(AuctionLoadingStates());
  static AuctionCubit get(context) => BlocProvider.of(context);

  WebSocketChannel? channel;
  // String auctionChannel = "auction.3";
  String btcUsdtPrice = "";
  MaxBid? maxBid;
  void connectToAuctionWebSocket({required String id}) {
    print("dddddddddddddfg");
    channel!.sink.close();

    emit(AuctionLoadingStates());

    try {
      final uri = Uri.parse(
        "wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false",
      );

      channel = IOWebSocketChannel.connect(uri);

      if (channel == null) {
        emit(AuctionErrorStates(error: 'فشل إنشاء اتصال.'));
        return;
      }

      final subscribePayload = {
        "event": "pusher:subscribe",
        "data": {"channel": "auction.$id"},
      };

      channel!.stream.listen(
        (message) {
          emit(AuctionLoadingStates());

          try {
            final decoded = jsonDecode(message);
            final event = decoded["event"];
            final data = decoded["data"];

            if (event == "pusher:connection_established") {
              channel!.sink.add(jsonEncode(subscribePayload));
            }

            if (event == "pusher_internal:subscription_succeeded") {
              print(' تم الاشتراك بنجاح في القناة');
              return;
            }

            if (data != null && event != null) {
              final payload = jsonDecode(data);

              final maxBd = payload['auction']?['max_bid'];
              if (maxBd != null) {
                // print('[max_bid: $maxBd');
                maxBid = MaxBid.fromJson(maxBd);
                // print(' max_bid: ${maxBid!.user}');
                emit(AuctionSuccessStates(auctionStatusModel: maxBid!));
              } else {
                print(' لا يوجد max_bid في الرسالة');
              }
            }
          } catch (e) {
            print(' خطأ في تحليل البيانات: $e');
          }
        },
        onError: (error) {
          print(' خطأ في الاتصال: $error');
          emit(AuctionErrorStates(error: error.toString()));
        },
        onDone: () {
          print(' تم إغلاق الاتصال، سيتم إعادة المحاولة...');
          Future.delayed(Duration(seconds: 3), () {
            connectToAuctionWebSocket(id: id);
          });
        },
      );
    } catch (e) {
      print(' استثناء غير متوقع: $e');
      emit(AuctionErrorStates(error: 'حدث خطأ أثناء الاتصال: $e'));
    }
  }

  AuctionModel? auctionModel;
  String? auctionId = "";
  void auctionState({required String id, required String state}) {
    emit(AuctionEventLoadingStates());

    try {
      final uri = Uri.parse(
        "wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false",
      );

      channel = IOWebSocketChannel.connect(uri);

      if (channel == null) {
        emit(AuctionEventErrorStates(error: 'فشل إنشاء اتصال WebSocket.'));
        return;
      }

      final subscribePayload = {
        "event": "pusher:subscribe",
        "data": {"channel": "auction.$state.$id"},
      };

      channel!.stream.listen(
        (message) {
          emit(AuctionEventLoadingStates());

          try {
            final decoded = jsonDecode(message);
            final event = decoded["event"];
            final data = decoded["data"];

            if (event == "pusher:connection_established") {
              channel!.sink.add(jsonEncode(subscribePayload));
            }

            if (event == "pusher_internal:subscription_succeeded") {
              print('[WebSocket] ✅ تم الاشتراك بنجاح في القناة');
              return;
            }

            if (data != null && event != null) {
              final payload = jsonDecode(data);

              final auction = payload['auction'];
              if (auction != null) {
                print('[WebSocket] ✅ DATA: $auction');
                auctionModel = AuctionModel.fromJson(auction);
                print('[WebSocket] ✅ max_bid: ${auctionModel!.auction}');
                emit(AuctionEventSuccessStates());
              } else {
                print('[WebSocket] ⚠️ لا يوجد max_bid في الرسالة');
              }
            }
          } catch (e) {
            print('[WebSocket] ❌ خطأ في تحليل البيانات: $e');
          }
        },
        onError: (error) {
          print('[WebSocket] ❌ خطأ في الاتصال: $error');
          emit(AuctionEventErrorStates(error: error.toString()));
        },
        onDone: () {
          print('[WebSocket] ℹ️ تم إغلاق الاتصال، سيتم إعادة المحاولة...');
          Future.delayed(Duration(seconds: 3), () {
            connectToAuctionWebSocket(id: id);
          });
        },
      );
    } catch (e) {
      print('[WebSocket] ❌ استثناء غير متوقع: $e');
      emit(AuctionEventErrorStates(error: 'حدث خطأ أثناء الاتصال: $e'));
    }
  }

  void auctionsLoop({
    required List<String> ids,
    required String state,
    required BuildContext context,
  }) {
    emit(AuctionEventLoadingStates());
    print(ids);
    try {
      final uri = Uri.parse(
        "wss://mzaodin.com/app/k5n849mwzstmvbgppimp?protocol=7&client=js&version=7.0.3&flash=false",
      );

      channel = IOWebSocketChannel.connect(uri);

      if (channel == null) {
        emit(AuctionEventErrorStates(error: 'فشل إنشاء اتصال WebSocket.'));
        return;
      }

      channel!.stream.listen(
        (message) {
          emit(AuctionEventLoadingStates());

          try {
            final decoded = jsonDecode(message);
            final event = decoded["event"];
            final data = decoded["data"];

            if (event == "pusher:connection_established") {
              for (var id in ids) {
                final subscribePayload = {
                  "event": "pusher:subscribe",
                  "data": {"channel": "auction.$state.$id"},
                };
                channel!.sink.add(jsonEncode(subscribePayload));
              }

              debugPrint('✅ Subscribed to all auction channels');
            }

            if (event == "pusher_internal:subscription_succeeded") {
              print('[WebSocket] ✅ تم الاشتراك بنجاح في القناة');
              return;
            }

            if (data != null && event != null) {
              final payload = jsonDecode(data);

              final auction = payload['auction'];
              if (auction != null) {
                print('[WebSocket] ✅ DATA: $auction');
                auctionId = auction['id'].toString();
                if (state == "ongoing") {
                  context.read<OngoingCubit>().excludeAuctionById(
                    auctionId.toString(),
                  );
                } else if (state == "ready") {
                  context.read<ReadyCubit>().excludeAuctionById(
                    auctionId.toString(),
                  );
                } else {
                  context.read<FinishedCubit>().excludeAuctionById(
                    auctionId.toString(),
                  );
                }

                print("sss");

                print(auctionId);

                auctionModel = AuctionModel.fromJson(auction);
                emit(AuctionEventSuccessStates());
              } else {
                print('[WebSocket] ⚠️ لا يوجد max_bid في الرسالة');
              }
            }
          } catch (e) {
            print('[WebSocket] ❌ خطأ في تحليل البيانات: $e');
          }
        },
        onError: (error) {
          print('[WebSocket] ❌ خطأ في الاتصال: $error');
          emit(AuctionEventErrorStates(error: error.toString()));
        },
        onDone: () {
          print('[WebSocket] ℹ️ تم إغلاق الاتصال، سيتم إعادة المحاولة...');
          Future.delayed(Duration(seconds: 3), () {
            auctionsLoop(ids: ids, state: state, context: context);
          });
        },
      );
    } catch (e) {
      print('[WebSocket] ❌ استثناء غير متوقع: $e');
      emit(AuctionEventErrorStates(error: 'حدث خطأ أثناء الاتصال: $e'));
    }
  }

  void disconnectWebSocket() {
    channel!.sink.close();
  }
}

// void getModel(onGoaingModel ongoingModel) {
//   ongoingModel.data.where((model) => model.id != auctionId);
//   emit(UpdateState);
// }
