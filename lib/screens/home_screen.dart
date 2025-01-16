import 'package:flutter/material.dart';
import '../widgets/device_list.dart';
import '../widgets/cast_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenCasterz Home'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await fetchDevices();
        },
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: DeviceList(),
  }
              ),
            ),
            CastButton(),
          ],
        ),
      ),
    );
  }
}

              ),
            ),
            CastButton(),
          ],
        ),
      ),
    );
  }
}

}
