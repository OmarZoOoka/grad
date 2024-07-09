import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  ThemeMode _themeMode = ThemeMode.system;
  String _selectedLanguage = 'English';
  String _selectedTimeZone = 'GMT';

  final List<String> _languages = ['English', 'Arabic', 'French', 'German', 'Chinese'];
  final List<String> _timeZones = ['GMT',  'EST', 'PST', 'CST'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notification Settings
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              secondary: const Icon(Icons.notifications),
            ),

            // Theme Settings
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text('Theme'),
              trailing: DropdownButton<ThemeMode>(
                value: _themeMode,
                onChanged: (ThemeMode? newValue) {
                  setState(() {
                    if (newValue != null) {
                      _themeMode = newValue;
                    }
                  });
                },
                items: ThemeMode.values.map((ThemeMode mode) {
                  return DropdownMenuItem<ThemeMode>(
                    value: mode,
                    child: Text(mode.toString().split('.').last),
                  );
                }).toList(),
              ),
            ),

            // Language Settings
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != null) {
                      _selectedLanguage = newValue;
                    }
                  });
                },
                items: _languages.map<DropdownMenuItem<String>>((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
            ),

            // Time Zone Settings
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Time Zone'),
              trailing: DropdownButton<String>(
                value: _selectedTimeZone,
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != null) {
                      _selectedTimeZone = newValue;
                    }
                  });
                },
                items: _timeZones.map<DropdownMenuItem<String>>((String timeZone) {
                  return DropdownMenuItem<String>(
                    value: timeZone,
                    child: Text(timeZone),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}