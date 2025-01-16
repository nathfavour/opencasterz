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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: isCasting ? null : toggleCasting,
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
                width: 24,
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  'Cast',
                  key: ValueKey('cast'),
                ),
        ),
      ),

    );
  }

}
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Cast',
                key: ValueKey('cast'),
              ),
      ),
    );
  }
}
          child: isCasting
        ),
        elevation: 5,
      ),
      child: isCasting ? CircularProgressIndicator() : Text('Cast'),
    );
  }
          return FadeTransition(opacity: animation, child: child);
        },
        child: isCasting
            ? SizedBox(
}

        elevation: 5,
        duration: Constants.animationDuration,
        transitionBuilder: (child, animation) {
      ),
      child: AnimatedSwitcher(