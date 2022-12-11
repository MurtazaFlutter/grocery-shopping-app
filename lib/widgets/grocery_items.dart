// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final Color color;
  final String imagePath;
  final String itemPrice;
  void Function()? onPress;
  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.color,
    required this.imagePath,
    required this.itemPrice,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 150,
            ),
            Text(itemName),
            MaterialButton(
              onPressed: onPress,
              color: color,
              child: Text(
                'Rs $itemPrice',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
