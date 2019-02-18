import 'package:flutter/material.dart';
import 'package:panache_lib/panache_lib.dart';

void main() => runApp(ColorSchemeApp());

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
              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: ColorSelector('primary', primaryColor,
                            (c) => setState((() => primaryColor = c))),
                      ),
                      Flexible(
                        child: ColorSelector(
                            'primary variant',
                            primaryVariantColor,
                            (c) => setState((() => primaryVariantColor = c))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: ColorSelector('secondary', secondaryColor,
                            (c) => setState((() => secondaryColor = c))),
                      ),
                      Flexible(
                        child: ColorSelector(
                            'secondary variant',
                            secondaryVariantColor,
                            (c) => setState((() => secondaryVariantColor = c))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: ColorSelector('onPrimary', onPrimaryColor,
                            (c) => setState((() => onPrimaryColor = c))),
                      ),
                      Flexible(
                        child: ColorSelector('onSecondary', onSecondaryColor,
                            (c) => setState((() => onSecondaryColor = c))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: ColorSelector('background', backgroundColor,
                            (c) => setState((() => backgroundColor = c))),
                      ),
                      Flexible(
                        child: ColorSelector('onBackground', onBackgroundColor,
                            (c) => setState((() => onBackgroundColor = c))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: ColorSelector('surface', surfaceColor,
                            (c) => setState((() => surfaceColor = c))),
                      ),
                      Flexible(
                        child: ColorSelector('onSurface', onSurfaceColor,
                            (c) => setState((() => onSurfaceColor = c))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: ColorSelector('error', errorColor,
                            (c) => setState((() => errorColor = c))),
                      ),
                      Flexible(
                        child: ColorSelector('onError', onErrorColor,
                            (c) => setState((() => onErrorColor = c))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ColorBox(
                    key: Key('primaryBox'),
                    labelText: 'primary',
                    onLabelText: 'onPrimary',
                    backgroundColor: primaryColor,
                    onLabelColor: onPrimaryColor,
                    onLabelStyle: textTheme.title,
                  ),
                  ColorBox(
                    key: Key('primaryVariantBox'),
                    labelText: 'primaryVariant',
                    onLabelText: 'onPrimary',
                    backgroundColor: primaryVariantColor,
                    onLabelColor: onPrimaryColor,
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
                    backgroundColor: secondaryColor,
                    onLabelColor: onSecondaryColor,
                    onLabelStyle: textTheme.title,
                  ),
                  ColorBox(
                    key: Key('secondaryVariantBox'),
                    labelText: 'secondaryVariant',
                    onLabelText: 'onSecondary',
                    backgroundColor: secondaryVariantColor,
                    onLabelColor: onSecondaryColor,
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
                    backgroundColor: backgroundColor,
                    onLabelColor: onBackgroundColor,
                    onLabelStyle: textTheme.subhead,
                  ),
                  ColorBox(
                    key: Key('surfaceBox'),
                    labelText: 'surface',
                    onLabelText: 'onSurface',
                    backgroundColor: surfaceColor,
                    onLabelColor: onSurfaceColor,
                    onLabelStyle: textTheme.subhead,
                  ),
                  ColorBox(
                    key: Key('errorBox'),
                    labelText: 'error',
                    onLabelText: 'onError',
                    backgroundColor: errorColor,
                    onLabelColor: onErrorColor,
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
