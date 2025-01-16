import 'package:flutter/material.dart';
import '../services/casting_service.dart';

class CastButton extends StatefulWidget {
  @override
  _CastButtonState createState() => _CastButtonState();
}

class _CastButtonState extends State<CastButton> {
  bool isCasting = false;

  void toggleCasting() async {
    setState(() {
      isCasting = true;
    });
    // Start casting
    await CastingService.startCasting();
    setState(() {
      isCasting = false;
    });
    // Navigate to CastScreen
    Navigator.pushNamed(context, '/cast');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isCasting ? null : toggleCasting,
      child: isCasting ? CircularProgressIndicator() : Text('Cast'),
    );
  }
}
