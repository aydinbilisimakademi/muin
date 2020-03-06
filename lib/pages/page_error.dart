import 'package:flutter/material.dart';

class PageError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Container(
        child: Center(
          child: Text("ERROR"),
        ),
      ),
    );
  }
}
