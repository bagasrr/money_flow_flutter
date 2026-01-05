import 'package:flut_app/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final int index;
  final String transactionTitle;
  final int transactionAmount;
  final DateTime transactionDate;
  final String transactionCategory;

  const TransactionCard({
    super.key,
    required this.index,
    required this.transactionTitle,
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.amber[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Sudut tumpul
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 1. BAGIAN ICON (KIRI)
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.indigo[700],
              child: const Icon(
                Icons.monetization_on,
                color: Colors.white,
                size: 28,
              ),
            ),

            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${transactionCategory == "Income" ? "+" : "-"} ${CurrencyFormat.convertToIdr(transactionAmount, 0)}",
                    style: TextStyle(
                      color: transactionCategory == "Income"
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transactionTitle,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            Text(
              DateFormat.yMMMd().format(transactionDate),
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
