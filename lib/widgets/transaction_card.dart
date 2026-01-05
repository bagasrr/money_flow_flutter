import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final int index;
  final String transactionTitle;
  final int transactionAmount;
  final String transactionDate;
  final String transactionCategory;

  const TransactionCard({
    super.key,
    required this.index,
    required this.transactionTitle,
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionCategory,
  });

  // Fungsi helper untuk bikin format angka ada titiknya (contoh: 20.000.000)
  String getFormattedCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.amber[50],
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

            const SizedBox(width: 15), // Jarak antara Icon dan Text
            // 2. BAGIAN TEXT TENGAH (MENGGUNAKAN EXPANDED)
            // Expanded ini yang bikin dia rapi dan mendorong tanggal ke kanan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Rata Kiri
                children: [
                  Text(
                    // Logika format text: Tanda +/- lalu panggil fungsi format angka
                    "${transactionCategory == "Income" ? "+" : "-"} Rp${getFormattedCurrency(transactionAmount)}",
                    style: TextStyle(
                      color: transactionCategory == "Income"
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow
                          .ellipsis, // Kalau kepanjangan jadi ... (titik tiga)
                    ),
                  ),
                  const SizedBox(height: 4), // Jarak dikit
                  Text(
                    transactionTitle,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis, // Kalau kepanjangan jadi ...
                  ),
                ],
              ),
            ),

            // 3. BAGIAN TANGGAL (KANAN)
            Text(
              transactionDate,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
