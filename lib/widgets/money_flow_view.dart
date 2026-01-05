import 'package:flutter/material.dart';

class MoneyFlowView extends StatelessWidget {
  final String category;
  final String amount;

  // 1. Tambahkan variabel warna. Tanda tanya (?) artinya boleh null (kosong)
  final Color? categoryColor;

  const MoneyFlowView({
    super.key,
    required this.category,
    required this.amount,
    // 2. Tambahkan di constructor.
    // Tidak pakai 'required' supaya opsional.
    this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          // 3. Masukkan warna ke dalam TextStyle
          style: TextStyle(
            // Tanda '??' artinya: Jika categoryColor null, pakai Colors.black
            color: categoryColor ?? Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: categoryColor ?? Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
