import 'package:flutter/material.dart';
import '/widgets/money_flow_view.dart';
import '/widgets/transaction_list.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Balance Header Section
          Column(
            children: [
              Text("Your Balanced"),
              Text(
                "Rp 100.000.000",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Money Flow View Section
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber[200],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                // CARA PANGGILNYA SEKARANG BENAR:
                const MoneyFlowView(
                  category: "Income",
                  amount: "Rp 50.000.000",
                  categoryColor: Colors.green,
                ),
                const SizedBox(height: 10), // Memberi jarak sedikit
                // Kita bisa memakainya lagi dengan data berbeda (Reusable)
                const MoneyFlowView(
                  category: "Expense",
                  amount: "Rp 20.000.000",
                  categoryColor: Colors.red, // Contoh pakai warna merah
                ),

                const Divider(height: 20, thickness: 1, color: Colors.black),

                const MoneyFlowView(
                  category: "Total",
                  amount: "Rp 100.000.000",
                ),
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
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.amber[700], thickness: 1),
                itemBuilder: (context, index) {
                  return TransactionList(index: index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
