// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Widgets/profile/content.dart';
import '../Widgets/profile/copyrightSymbol.dart';
import '../Widgets/profile/heading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          HeadingSupport(),
          SizedBox(height: 10),
          Content(),
          CopyRightSymbol(),
        ]),
      ),
    );
  }
}
