import 'package:flutter/material.dart';

class CenteredCircularProgressIndicatior extends StatelessWidget {
  const CenteredCircularProgressIndicatior({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
