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

class ColorLabel {
  final String label;
  final Color value;

  const ColorLabel(this.label, this.value);
}

class ColorSelectorData {
  final ColorLabel color;
  final ValueChanged<Color> onColorChange;

  const ColorSelectorData(this.color, this.onColorChange);
}

class _ColorSchemeControlsState extends State<ColorSchemeControls> {
  List<ColorLabel> primaries;
  List<ColorLabel> secondaries;
  List<ColorLabel> onMainColors;
  List<ColorLabel> backgroundColors;
  List<ColorLabel> surfaceColors;
  List<ColorLabel> errorColors;

  @override
  void initState() {
    super.initState();

    _initColors();
  }

  @override
  void didUpdateWidget(ColorSchemeControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scheme != widget.scheme) _initColors();
  }

  void _initColors() {
    primaries = [
      ColorLabel('primary', widget.scheme.primary),
      ColorLabel('primaryVariant', widget.scheme.primaryVariant),
    ];
    secondaries = [
      ColorLabel('secondary', widget.scheme.secondary),
      ColorLabel('secondaryVariant', widget.scheme.secondaryVariant),
    ];

    onMainColors = [
      ColorLabel('onPrimary', widget.scheme.onPrimary),
      ColorLabel('onSecondary', widget.scheme.onSecondary),
    ];

    backgroundColors = [
      ColorLabel('background', widget.scheme.background),
      ColorLabel('onBackground', widget.scheme.onBackground),
    ];

    surfaceColors = [
      ColorLabel('surface', widget.scheme.surface),
      ColorLabel('onSurface', widget.scheme.onSurface),
    ];

    errorColors = [
      ColorLabel('error', widget.scheme.error),
      ColorLabel('onError', widget.scheme.onError),
    ];
  }

  void _onColorSelected(String property, Color value) =>
      widget.onSchemeChanged(_apply(property, value));

  ColorScheme _apply(String colorLabel, Color color) {
    Map<Symbol, dynamic> args = {Symbol(colorLabel): color};
    return Function.apply(widget.scheme.copyWith, null, args);
  }

  ColorSelectorRow _buildColorSelectorRow(List<ColorLabel> colors) =>
      ColorSelectorRow(
        colors: colors
            .map((item) =>
                ColorSelectorData(item, (c) => _onColorSelected(item.label, c)))
            .toList(),
      );

  @override
  Widget build(BuildContext context) => ListView(
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

class ColorSelectorRow extends StatelessWidget {
  final List<ColorSelectorData> colors;

  const ColorSelectorRow({Key key, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Row(children: colors.map(_buildColorBox).toList());

  Widget _buildColorBox(ColorSelectorData data) => Flexible(
        child: ColorSelector(
            data.color.label, data.color.value, data.onColorChange),
      );
}
