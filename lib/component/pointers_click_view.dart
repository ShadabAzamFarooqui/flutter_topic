import 'package:flutter/material.dart';

class PointersClickView extends StatelessWidget {
  final String text;
  final String count;
  final VoidCallback onTap;

  const PointersClickView({
    super.key,
    required this.text,
    required this.onTap,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Row(
          children: [
            Text(
              '$count. ',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),

            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
