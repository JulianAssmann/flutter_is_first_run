# is_first_run

A simple package to check if it is the first time the app runs.

Internally it uses the [shared_preferences](https://pub.dev/packages/shared_preferences) plugin.

## Getting Started

To use this plugin, add `is_first_run` as a [dependency in your `pubspec.yaml` file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Usage

Import `is_first_run.dart`:

```dart
import 'package:is_first_run/is_first_run.dart';
```

Then check, if this is the first time the app is run:

```dart
bool firstRun = await IsFirstRun.isFirstRun();
```

Calling this function for the first time after installing the app returns `true`, after that every function call returns `false`.

You can reset the plugin by calling

```dart
await IsFirstRun.reset();
```

After calling `reset()` the first call of `isFirstRun()` will return `true`, subsequent calls will return `false` again.

## Example

The example is a simple page showing you the result of the function `IsFirstRun.isFirstRun()`. A button allows you to call `IsFirstRun.isFirstRun()` again, the reset button calls `IsFirstRun.reset()`.

## Maintainers

* [Julian Aßmann](https://github.com/JulianAssmann)

Pull requests are always very welcome.