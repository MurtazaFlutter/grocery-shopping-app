import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final color;
  final String imagePath;
  final String itemPrice;
  final void Function()? onPress;
  const GroceryItemTile({
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
              color: color[700],
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
