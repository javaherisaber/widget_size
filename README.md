# widget_size
[![pub package](https://img.shields.io/pub/v/widget_size.svg)](https://pub.dartlang.org/packages/widget_size)

A widget to calculate it's size after being built and attached to a widget tree

![](demo.gif)

## Usage

To use this plugin, add [widget_size](https://pub.dartlang.org/packages/widget_size/install) as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  widget_size: ^lastVersion
```

## Example

```dart
double _yourHeight = 50;
double _yourWidth = 50;

WidgetSize(
  onChange: (Size size) {
    // your Widget size available here
    _yourHeight = size.height;
    _yourWidth = size.width;
  },
  child: Container(
    height: _yourHeight,
    width: _yourWidth,
    color: Theme.of(context).primaryColor,
  ),
)
```
