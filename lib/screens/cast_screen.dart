import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../services/casting_service.dart';

class CastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = CastingService.getSelectedDevice();

    if (device == null) {
      Navigator.pop(context);
      return SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Casting'),
        backgroundColor: Constants.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cast_connected,
              size: 100,
              color: Constants.primaryColor,
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: 1.0,
              duration: Constants.animationDuration,
              child: Text(
                'Casting to ${device.name}...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.stop),
        backgroundColor: Constants.accentColor,
        tooltip: 'Stop Casting',
      ),
    );
  }
}
