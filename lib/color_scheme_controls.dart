import 'package:flutter/material.dart';
import 'package:panache_lib/panache_lib.dart';

class ColorSchemeControls extends StatefulWidget {
  final ColorScheme scheme;
  final ValueChanged<ColorScheme> onSchemeChanged;

  const ColorSchemeControls({Key key, this.onSchemeChanged, this.scheme})
      : super(key: key);

  @override
  _ColorSchemeControlsState createState() => _ColorSchemeControlsState();
}

class _ColorSchemeControlsState extends State<ColorSchemeControls> {
  @override
  void initState() {
    super.initState();
  }

  onColorSelected(String property, Color value) {
    widget.onSchemeChanged(apply(property, value));
  }

  ColorScheme apply(String colorLabel, Color color) {
    Map<Symbol, dynamic> args = {Symbol(colorLabel): color};
    return Function.apply(widget.scheme.copyWith, null, args);
  }

  ColorSelectorRow _buildColorSelectorRow(List<List<dynamic>> colors) =>
      ColorSelectorRow(
        colors: colors
            .map((item) => ColorSelectorData(
                item[0], item[1], (c) => onColorSelected(item[0], c)))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> primaries = [
      ['primary', widget.scheme.primary],
      ['primaryVariant', widget.scheme.primaryVariant],
    ];

    final secondaries = [
      ['secondary', widget.scheme.secondary],
      ['secondaryVariant', widget.scheme.secondaryVariant],
    ];

    final onMainColors = [
      ['onPrimary', widget.scheme.onPrimary],
      ['onSecondary', widget.scheme.onSecondary],
    ];

    final backgroundColors = [
      ['background', widget.scheme.background],
      ['onBackground', widget.scheme.onBackground],
    ];

    final surfaceColors = [
      ['surface', widget.scheme.surface],
      ['onSurface', widget.scheme.onSurface],
    ];

    final errorColors = [
      ['error', widget.scheme.error],
      ['onError', widget.scheme.onError],
    ];

    return ListView(
      children: <Widget>[
        _buildColorSelectorRow(primaries),
        _buildColorSelectorRow(secondaries),
        _buildColorSelectorRow(onMainColors),
        _buildColorSelectorRow(backgroundColors),
        _buildColorSelectorRow(surfaceColors),
        _buildColorSelectorRow(errorColors),
      ],
    );
  }
}

class ColorSelectorData {
  final Color color;
  final ValueChanged<Color> onColorChange;

  final String label;

  const ColorSelectorData(this.label, this.color, this.onColorChange);
}

class ColorSelectorRow extends StatelessWidget {
  final List<ColorSelectorData> colors;

  const ColorSelectorRow({Key key, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: colors.map(_buildColorBox).toList());
  }

  Widget _buildColorBox(ColorSelectorData color) => Flexible(
        child: ColorSelector(color.label, color.color, color.onColorChange),
      );
}
