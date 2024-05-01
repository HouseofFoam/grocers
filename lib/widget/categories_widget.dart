import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Function()? onTap;
  final int index;
  final int intendedIndex;
  final String name;
  final String image;
  const CategoriesWidget(
      {super.key,
      this.onTap,
      required this.index,
      required this.name,
      required this.intendedIndex,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: index == intendedIndex
                ? Color.fromARGB(255, 128, 156, 233)
                : Colors.white,
            child: Text(
              name,
              style: TextStyle(
                color: index == intendedIndex
                    ? Colors.white
                    : Color.fromARGB(255, 180, 197, 245),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
