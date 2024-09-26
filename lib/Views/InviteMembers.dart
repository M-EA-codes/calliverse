import 'package:flutter/material.dart';

void showInviteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Invite Members'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Invite Link',
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {},
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Invite Code',
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Invite Friend'),
          ),
        ],
      );
    },
  );
}
