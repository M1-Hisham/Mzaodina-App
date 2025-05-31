abstract class WebSocketState {}

class WebSocketInitial extends WebSocketState {}

class WebSocketServerTimeUpdated extends WebSocketState {
  final String serverTime;
  WebSocketServerTimeUpdated(this.serverTime);
}

class WebSocketError extends WebSocketState {
  final String error;
  WebSocketError(this.error);
}

class WebSocketDone extends WebSocketState {
  final String message;
  WebSocketDone(this.message);
}