import 'package:flut_app/utils/currency_format.dart';
import 'package:flutter/material.dart';
import '/widgets/money_flow_view.dart';
import '/widgets/transaction_card.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<Map<String, dynamic>> transactionData = [
    {
      "transactionTitle": "Buy Laptop",
      "amount": 2000000,
      "category": "Expense",
      "transactionDate": DateTime(2025, 12, 19),
    },
    {
      "transactionTitle": "Sell Phone",
      "amount": 1500000,
      "category": "Expense",
      "transactionDate": DateTime(2026, 1, 1),
    },
    {
      "transactionTitle": "Freelance Project",
      "amount": 5000000,
      "category": "Income",
      "transactionDate": DateTime(2026, 1, 3),
    },
    {
      "transactionTitle": "Grocery Shopping",
      "amount": 500000,
      "category": "Expense",
      "transactionDate": DateTime(2026, 1, 5),
    },
    {
      "transactionTitle": "Movie Ticket",
      "amount": 200000,
      "category": "Income",
      "transactionDate": DateTime(2026, 1, 2),
    },
    {
      "transactionTitle": "Gas Station",
      "amount": 10000,
      "category": "Expense",
      "transactionDate": DateTime(2026, 1, 3),
    },
    {
      "transactionTitle": "Grocery Shopping",
      "amount": 500000,
      "category": "Expense",
      "transactionDate": DateTime(2026, 1, 1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalIncome = transactionData
        .where((item) => item['category'] == 'Income')
        .fold(0, (sum, item) => sum + (item['amount'] as int));

    int totalExpense = transactionData
        .where((item) => item['category'] == 'Expense')
        .fold(0, (sum, item) => sum + (item['amount'] as int));

    int totalBalance = totalIncome - totalExpense;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Balance Header Section
          Column(
            children: [
              Text("Your Balanced"),
              Text(
                CurrencyFormat.convertToIdr(totalBalance, 0),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Money Flow View Section
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber[100],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                // CARA PANGGILNYA SEKARANG BENAR:
                MoneyFlowView(category: "Income", amount: totalIncome),
                const SizedBox(height: 10), // Memberi jarak sedikit
                // Kita bisa memakainya lagi dengan data berbeda (Reusable)
                MoneyFlowView(category: "Expense", amount: totalExpense),

                const Divider(height: 20, thickness: 1, color: Colors.black),

                MoneyFlowView(category: "Total", amount: totalBalance),
              ],
            ),
          ),
          // List of Transactions Section
          Expanded(
            flex: 1,

            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                children: transactionData.map((transaction) {
                  int index = transactionData.indexOf(transaction);
                  return TransactionCard(
                    index: index,
                    transactionTitle: transaction["transactionTitle"],
                    transactionAmount: transaction["amount"],
                    transactionDate: transaction["transactionDate"],
                    transactionCategory: transaction["category"],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
