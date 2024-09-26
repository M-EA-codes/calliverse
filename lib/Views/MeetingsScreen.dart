import 'package:flutter/material.dart';

class MeetingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Meetings'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter a code or link',
                filled: true,
                fillColor:
                    Colors.grey[200], // Light gray background for the input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white, // White background for Join button
                  ),
                  child: Text(
                    'Join',
                    style: TextStyle(color: Colors.blue), // Blue text
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Start an Instant Meeting'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/scheduleMeeting');
            },
            child: Text('Schedule for later'),
          ),
          Expanded(
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              onDateChanged: (date) {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Highlight the "Meetings" icon
        selectedItemColor: Colors.blue, // Blue for the selected item
        unselectedItemColor: Colors.grey, // Gray for the other items
        onTap: (index) {
          // Handle navigation logic based on the selected index.
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.videocam, color: Colors.blue), // Blue Meetings icon
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'AI Bot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
