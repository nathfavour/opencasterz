import 'package:flutter/material.dart';

class CastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casting'),
      ),
      body: Center(
        Text('Casting to selected device...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.stop),
        tooltip: 'Stop Casting',
      ),
    );
  }
}
