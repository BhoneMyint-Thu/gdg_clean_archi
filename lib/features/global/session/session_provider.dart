import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'session_notifier.dart';
part 'session_state.dart';

final sessionNotifierProvider = AutoDisposeNotifierProvider<SessionNotifier,SessionState>(
  SessionNotifier.new,
);