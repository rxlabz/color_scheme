import 'package:color_scheme/color_scheme_controls.dart';
import 'package:color_scheme/color_scheme_preview.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ColorSchemeControls(
                  scheme: scheme,
                  onSchemeChanged: (newScheme) =>
                      setState(() => scheme = newScheme)),
            ),
            Expanded(child: ColorSchemePreview(scheme: scheme))
          ],
        ),
      ),
    );
  }
}
