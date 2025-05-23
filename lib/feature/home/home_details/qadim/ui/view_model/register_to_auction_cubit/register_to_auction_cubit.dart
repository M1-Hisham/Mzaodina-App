import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_to_auction_state.dart';

class RegisterToAuctionCubit extends Cubit<RegisterToAuctionState> {
  RegisterToAuctionCubit() : super(RegisterToAuctionInitial());
}
