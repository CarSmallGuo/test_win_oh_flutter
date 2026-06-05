# OHOS Flutter Windows `operatingSystem == 'ohos'` Probe

This repository verifies whether an OHOS Flutter SDK build can execute a
Windows Flutter app that evaluates the updated `plugin_ffi` template platform
condition:

```dart
Platform.isAndroid || Platform.isLinux || Platform.operatingSystem == 'ohos'
```

The probe runs on `windows-latest`, clones the OHOS Flutter SDK, creates a
Windows Flutter app, injects `tools/windows_probe_main.dart` as `lib/main.dart`,
builds the app, and runs the generated `.exe`.

The app exits with:

- `0` when the expression is evaluated successfully.
- `42` when evaluating the expression throws.

The workflow also uploads the probe result file as an artifact.
