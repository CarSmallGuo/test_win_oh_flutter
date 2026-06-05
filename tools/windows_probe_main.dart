import 'dart:io';

import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final File resultFile = File('probe_result.txt');

  try {
    // This mirrors the plugin_ffi shared-library condition after replacing
    // Platform.isOhos with the standard dart:io operatingSystem check.
    final bool sharedObjectBranch =
        Platform.isAndroid ||
        Platform.isLinux ||
        Platform.operatingSystem == 'ohos';

    resultFile.writeAsStringSync(
      [
        'status=ok',
        'operatingSystem=${Platform.operatingSystem}',
        'isWindows=${Platform.isWindows}',
        'sharedObjectBranch=$sharedObjectBranch',
      ].join('\n'),
    );
    exit(0);
  } catch (error, stackTrace) {
    resultFile.writeAsStringSync(
      [
        'status=error',
        'operatingSystem=${Platform.operatingSystem}',
        'isWindows=${Platform.isWindows}',
        'error=$error',
        'stack=$stackTrace',
      ].join('\n'),
    );
    exit(42);
  }
}
