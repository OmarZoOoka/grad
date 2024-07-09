import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: const Text('+201000109946'),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('Sho8lana@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text('Facebook'),
              subtitle: const Text('facebook.com/Sho8lana'),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('WhatsApp'),
              subtitle: const Text('+201000109946'),
            ),
            ListTile(
              leading: const Icon(Icons.linked_camera), 
              title: const Text('LinkedIn'),
              subtitle: const Text('linkedin.com/in/Sho8lana'),
            ),
          ],
        ),
      ),
    );
  }
}
