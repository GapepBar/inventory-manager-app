// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CopyRightSymbol extends StatelessWidget {
  const CopyRightSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Text(
            'gappebar',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
        ),
        Center(
          child: Text(
            'v1.0.0.1',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
