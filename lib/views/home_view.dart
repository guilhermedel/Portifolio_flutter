import 'package:flutter/material.dart';
import 'package:portifolio_flutter/widgets/custom_drawer.dart';
import 'package:portifolio_flutter/widgets/custom_dynamic_form.dart';
import 'package:provider/provider.dart';
import '../controllers/theme_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Switch(
            value: context.watch<ThemeController>().themeMode == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeController>().toggleTheme(value);
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: CustomDynamicForm()
      ),
    );
  }
}
