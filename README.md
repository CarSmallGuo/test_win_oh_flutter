# OHOS Flutter Windows `Platform.isOhos` Probe

This repository verifies whether an OHOS Flutter SDK build can execute a
Windows Flutter app that evaluates the `plugin_ffi` template platform condition:

```dart
Platform.isAndroid || Platform.isLinux || Platform.isOhos
```

The probe runs on `windows-latest`, clones the OHOS Flutter SDK, creates a
Windows Flutter app, injects `tools/windows_probe_main.dart` as `lib/main.dart`,
builds the app, and runs the generated `.exe`.

The app exits with:

- `0` when the expression is evaluated successfully.
- `42` when evaluating `Platform.isOhos` throws, for example
  `No static getter 'isOhos'`.

The workflow also uploads the probe result file as an artifact.
