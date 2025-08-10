part of 'session_provider.dart';

class SessionNotifier extends AutoDisposeNotifier<SessionState> {
  @override
  SessionState build() {
    return SessionStart();
  }

  void sessionExpired() => state = SessionExpired();

}
