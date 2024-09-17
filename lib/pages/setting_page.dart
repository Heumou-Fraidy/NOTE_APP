import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Row(children: [

        //dark mode
        Text("Dark Mode"),

        //switch toggle
        CupertinoSwitch(
          value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
          onChanged: (value) =>
          Provider.of<ThemeProvider>(context, listen: false)
          .toggleTheme(),
        )
      ],
      ),
      
      );
    
  }
}