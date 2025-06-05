abstract class WebSocketState {}

class WebSocketInitial extends WebSocketState {}

class WebSocketServerTimeUpdated extends WebSocketState {
  final String serverTime;
  WebSocketServerTimeUpdated(this.serverTime);
}

class WebSocketAuctionUpdate extends WebSocketState {
  final Map<String, dynamic> auctionData;
  WebSocketAuctionUpdate(this.auctionData);
}

class WebSocketError extends WebSocketState {
  final String error;
  WebSocketError(this.error);
}

class WebSocketDone extends WebSocketState {
  final String message;
  WebSocketDone(this.message);
}
