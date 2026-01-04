import 'package:flutter/material.dart'; // 1. Wajib import ini buat UI
import 'dart:async'; // 2. Wajib import ini karena pake Timer

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  Timer? _timer;

  void _startIncrement() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  void _stopIncrement() {
    _timer?.cancel();
  }

  // 3. TAMBAHAN PENTING: dispose()
  // Gunanya: Kalau halaman ini ditutup, Timer dimatikan paksa biar HP gak panas/error
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahan Tombol"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTapDown: (_) => _startIncrement(),
              onTapUp: (_) => _stopIncrement(),
              onTapCancel: () => _stopIncrement(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  // Tambah bayangan biar makin kayak tombol beneran
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const Text(
                  "TAHAN AKU (+)",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => _counter = 0),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
