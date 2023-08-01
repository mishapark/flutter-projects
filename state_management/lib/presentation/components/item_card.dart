import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 90,
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: FilledButton(
          onPressed: onTap,
          child: const Text('Add'),
        ),
        isThreeLine: true,
      ),
    );
  }
}
