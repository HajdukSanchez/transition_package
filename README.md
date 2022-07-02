# Transition Package - @hajduksanchez

This package help you to handle navigation between pages, using some animations and configuration with some params.

Install the package:

```bash
flutter pub add jhs_transitions
```

## Basic usage

Basic example of the navigation

```dart
HsTransitions(
	context: context,
	child: const SecondPage(), // Final page
);
```

## With animation

Navigation using a specific animation

```dart
HsTransitions(
	context: context,
	child: const SecondPage(), // Final page
	animation: AnimationType.fadeIn,
);
```

## With duration

Animation duration to handle the time of the transition

```dart
HsTransitions(
	context: context,
	child: const SecondPage(), // Final page
	animation: AnimationType.fadeIn,
	duration: const Duration(milliseconds: 300)
);
```

## With replacement

This replacement help to navigate and delete the previous page

```dart
HsTransitions(
	context: context,
	child: const SecondPage(), // Final page
	animation: AnimationType.fadeIn,
	duration: const Duration(milliseconds: 300),
	replacement: true
);
```
