import 'package:flutter/material.dart';

Widget bottomLoadingIndicator() {
  return SizedBox(
    height: 40,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Loading more...',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
