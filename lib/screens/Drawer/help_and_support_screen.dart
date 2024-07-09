import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'General Help Tips',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Tip 1: How to use the app effectively'),
              subtitle: Text(
                  'Make sure to explore all the features and settings available in the app to customize your experience.'),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Tip 2: Keeping your profile updated'),
              subtitle: Text(
                  'Regularly update your profile with the latest information to ensure better visibility and credibility.'),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Tip 3: Managing notifications'),
              subtitle: Text(
                  'Adjust your notification settings to stay informed about important updates without being overwhelmed.'),
            ),
            const Divider(),
            const Text(
              'Frequently Asked Questions (FAQ)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: const Text('How do I reset my password?'),
              children: const [
                ListTile(
                  title: Text(
                      'To reset your password, go to the account settings, select "Change Password," and follow the instructions.'),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: const Text('How can I contact support?'),
              children: const [
                ListTile(
                  title: Text(
                      'You can contact support through the "Contact Us" section in the app or email us at ContactTeam@gmail.com.'),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: const Text('Where can I find the app\'s privacy policy?'),
              children: const [
                ListTile(
                  title: Text(
                      'The privacy policy is available in the settings menu under "Privacy Settings" or on our website.'),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.question_answer),
              title: const Text('How do I update my profile information?'),
              children: const [
                ListTile(
                  title: Text(
                      'To update your profile information, go to the profile section, select "Edit Profile," and make the necessary changes.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
