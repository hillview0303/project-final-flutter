import 'package:flutter/material.dart';

import '../diet_management_detail_page.dart';

class DietManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DietManagementDetailPage()),
      );
    },
    child: Card(
    elevation: 4.0,
    margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '식단',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
          ],
        ),
      ),
    ),
    );
  }
}
