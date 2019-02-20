import 'package:color_scheme/color_scheme_controls.dart';
import 'package:flutter/material.dart';

void main() => runApp(ColorSchemeApp());

Color primaryColor = Colors.cyan;
Color primaryVariantColor = Colors.cyan.shade800;
Color secondaryColor = Colors.purple;
Color secondaryVariantColor = Colors.purple.shade200;

Color backgroundColor = Colors.white;
Color surfaceColor = Colors.grey.shade300;
Color errorColor = Colors.red.shade700;

Color onPrimaryColor = Colors.yellow;
Color onSecondaryColor = Colors.purple.shade900;

Color onBackgroundColor = Colors.grey.shade700;
Color onSurfaceColor = Colors.blueGrey.shade700;
Color onErrorColor = Colors.orange.shade200;

Color getContrastColor(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.light
      ? Colors.black
      : Colors.white;
}

class ColorSchemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorSchemeScreen(),
    );
  }
}

class ColorSchemeScreen extends StatefulWidget {
  @override
  _ColorSchemeScreenState createState() => _ColorSchemeScreenState();
}

class _ColorSchemeScreenState extends State<ColorSchemeScreen> {
  ColorScheme scheme = ColorScheme(
      primary: primaryColor,
      primaryVariant: primaryVariantColor,
      secondary: secondaryColor,
      secondaryVariant: secondaryVariantColor,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onSurface: onSurfaceColor,
      onBackground: onBackgroundColor,
      onError: onErrorColor,
      brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ColorSchemeControls(
                  scheme: scheme,
                  onSchemeChanged: (newScheme) =>
                      setState(() => scheme = newScheme)),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ColorBox(
                    key: Key('primaryBox'),
                    labelText: 'primary',
                    onLabelText: 'onPrimary',
                    backgroundColor: scheme.primary,
                    onLabelColor: scheme.onPrimary,
                    onLabelStyle: textTheme.title,
                  ),
                  ColorBox(
                    key: Key('primaryVariantBox'),
                    labelText: 'primaryVariant',
                    onLabelText: 'onPrimary',
                    backgroundColor: scheme.primaryVariant,
                    onLabelColor: scheme.onPrimary,
                    onLabelStyle: textTheme.title,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ColorBox(
                    key: Key('secondaryBox'),
                    labelText: 'secondary',
                    onLabelText: 'onSecondary',
                    backgroundColor: scheme.secondary,
                    onLabelColor: scheme.onSecondary,
                    onLabelStyle: textTheme.title,
                  ),
                  ColorBox(
                    key: Key('secondaryVariantBox'),
                    labelText: 'secondaryVariant',
                    onLabelText: 'onSecondary',
                    backgroundColor: scheme.secondaryVariant,
                    onLabelColor: scheme.onSecondary,
                    onLabelStyle: textTheme.title,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ColorBox(
                    key: Key('backgroundBox'),
                    labelText: 'background',
                    onLabelText: 'onBackground',
                    backgroundColor: scheme.background,
                    onLabelColor: scheme.onBackground,
                    onLabelStyle: textTheme.subhead,
                  ),
                  ColorBox(
                    key: Key('surfaceBox'),
                    labelText: 'surface',
                    onLabelText: 'onSurface',
                    backgroundColor: scheme.surface,
                    onLabelColor: scheme.onSurface,
                    onLabelStyle: textTheme.subhead,
                  ),
                  ColorBox(
                    key: Key('errorBox'),
                    labelText: 'error',
                    onLabelText: 'onError',
                    backgroundColor: scheme.error,
                    onLabelColor: scheme.onError,
                    onLabelStyle: textTheme.subhead,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final Color backgroundColor;
  final Color onLabelColor;
  final String labelText;
  final String onLabelText;
  final TextStyle onLabelStyle;

  const ColorBox(
      {Key key,
      this.backgroundColor,
      this.onLabelColor,
      this.onLabelStyle,
      this.labelText,
      this.onLabelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                labelText,
                textAlign: TextAlign.start,
                style: TextStyle(color: getContrastColor(backgroundColor)),
              ),
            ),
            Expanded(
              child: Center(
                  child: Text(onLabelText,
                      style: onLabelStyle.copyWith(color: onLabelColor))),
            ),
          ],
        ),
      ),
    );
  }
}
