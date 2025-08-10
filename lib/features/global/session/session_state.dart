part of 'session_provider.dart';

sealed class SessionState {}
final class SessionStart extends SessionState{}
final class SessionExpired extends SessionState{}