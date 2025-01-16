import 'package:flutter/material.dart';
import '../services/casting_service.dart';
import '../utils/constants.dart';

class CastButton extends StatefulWidget {
  @override
  _CastButtonState createState() => _CastButtonState();
}

class _CastButtonState extends State<CastButton> {
  bool isCasting = false;

  Future<void> toggleCasting() async {
    if (isCasting) return;

    setState(() => isCasting = true);
    try {
      await CastingService.startCasting();
      Navigator.pushNamed(context, '/cast');
    } catch (e) {
      // Handle error
    } finally {
      setState(() => isCasting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: isCasting ? null : toggleCasting,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.borderRadius),
          ),
        ),
        child: AnimatedSwitcher(
          duration: Constants.animationDuration,
          child: isCasting
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                )
              : Text('Cast', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
