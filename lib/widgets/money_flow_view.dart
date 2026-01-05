import 'package:flut_app/utils/currency_format.dart';
import 'package:flutter/material.dart';

class MoneyFlowView extends StatelessWidget {
  final String category;
  final int amount;

  const MoneyFlowView({
    super.key,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: TextStyle(
            color: category == "Income"
                ? Colors.green
                : category == "Expense"
                ? Colors.red
                : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          CurrencyFormat.convertToIdr(amount, 0),
          style: TextStyle(
            color: category == "Income"
                ? Colors.green
                : category == "Expense"
                ? Colors.red
                : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
