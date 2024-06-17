import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yande_gui/widgets/auto_scaffold/auto_scaffold.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget buildItem({required String title,  String? subtitle, Function()? onTap}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoScaffold(
      verticalOnlyTitleWidget: const Text('Settings'),
      builder: (context, horizontal) {
        return ListView(
          children: [
            buildItem(
              title: 'Project URL',
              subtitle: 'https://github.com/normalllll/yande_gui',
              onTap: () {
                launchUrlString('https://github.com/normalllll/yande_gui');
              },
            ),
            buildItem(
              title: '@TODO',
            ),
          ],
        );
      },
    );
  }
}
