import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  final String userName;

  MeetingScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/user_profile.png'), // Add your image here
            ),
            SizedBox(height: 20),
            Text(userName, style: TextStyle(fontSize: 20)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
                IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.record_voice_over), onPressed: () {}),
                IconButton(icon: Icon(Icons.call_end), onPressed: () {}),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
