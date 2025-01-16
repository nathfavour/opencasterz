import 'package:flutter/material.dart';

class CastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cast_connected,
              size: 100,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: Text(
                'Casting to selected device...',
                'Casting to selected device...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.stop),
        tooltip: 'Stop Casting',
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}


                'Casting to selected device...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        tooltip: 'Stop Casting',
        backgroundColor: Constants.accentColor,
      ),
    );
  }
}
        },
        child: Icon(Icons.stop),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.stop),
        tooltip: 'Stop Casting',
        backgroundColor: Constants.accentColor,
      ),
    );
  }
}
