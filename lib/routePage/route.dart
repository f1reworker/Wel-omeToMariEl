import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Навигация"),
      ),
      body: Center(
        child: Text('Обратно!'),
      ),
    );
  }
}
