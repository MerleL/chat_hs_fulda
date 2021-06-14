import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }





  Widget sendMessage(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding:
        const EdgeInsets.fromLTRB((double.infinity / 2), 5.0, 5.0, 5.0),
        child: Column(
          children: [
            Text('Meine Nachricht'),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('11:00h'),
            ),
          ],
        ),
      ),
    );
  }
}
