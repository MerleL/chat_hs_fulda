import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ToDo: Unterseiten verlinken

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildHeader(context),
                buildSettings(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: styleContainer(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Einstellungen',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }

  Widget buildSettings(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          buildListTile(context, 'Profil', Icon(Icons.account_circle_rounded)),
          buildListTile(
              context, 'Benachrichtigungen', FaIcon(FontAwesomeIcons.bell)),
          buildListTile(context, 'Datenschutz', Icon(Icons.lock)),
          buildListTile(context, 'Chats', Icon(Icons.speaker_notes)),
          buildListTile(context, 'Sprache', Icon(Icons.language)),
          buildListTile(context, 'Hilfe', Icon(Icons.help)),
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context, String text, Widget icon) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      leading: icon,
    );
  }

  BoxDecoration styleContainer() {
    return BoxDecoration(
      color: Color.fromARGB(200, 240, 240, 240),
      border: Border.all(
        color: Color.fromARGB(255, 200, 200, 200),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
  }
}
