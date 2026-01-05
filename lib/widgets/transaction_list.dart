import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final int index;
  const TransactionList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber[700],
        child: Icon(Icons.monetization_on, color: Colors.white),
      ),
      title: Text(
        "Rp ${index % 2 == 0 ? "+" : "-"} ${((index + 1) * 1000000).toString()}",
        style: TextStyle(
          color: index % 2 == 0 ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Title Of Transaction ${index + 1}"),
      trailing: Text("01/01/2026"),
    );
  }
}
