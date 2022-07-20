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

To check if this is the first time the app is run:

```dart
bool firstRun = await IsFirstRun.isFirstRun();
```

If it is the first call of this method since installing the app, the method will return true for as long as the app keeps running. After a restart of the app, it returns `false`.

There is also a method that allows you to check if it is the first time you call it:

```dart
bool firstCall = await IsFirstRun.isFirstCall();
```

Calling this function for the first time after installing the app returns `true`, after that every function call returns `false`.

You can reset the plugin by calling:

```dart
await IsFirstRun.reset();
```

After calling `reset()`, calling `isFirstRun()` will return true as long as the app is running. After a restart, it will return false again. The first call of `isFirstCall()` will return `true`, subsequent calls will return `false` again.

## Example

The example is a simple page showing the result of the function `IsFirstRun.isFirstRun()`. A button allows you to call `IsFirstRun.isFirstRun()` again, the reset button calls `IsFirstRun.reset()`.

## Maintainers

* [Julian Aßmann](https://github.com/JulianAssmann)

Pull requests are always very welcome.