import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/ThemeProvider.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeProvider>(context);
    return IconButton(
        onPressed: themeModel.toggleTheme,
        icon: themeModel.isDarkMode
            ? const Icon(Icons.wb_sunny)
            : const Icon(Icons.nightlight_round));
  }
}
