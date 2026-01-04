import 'package:flutter/material.dart';

class GraphTimeFilter extends StatefulWidget {
  const GraphTimeFilter({super.key});

  @override
  State<GraphTimeFilter> createState() => _GraphTimeFilterState();
}

class _GraphTimeFilterState extends State<GraphTimeFilter> {
  final List<Map<String, String>> filterData = [
    {"long": "Daily", "short": "D"},
    {"long": "Weekly", "short": "W"},
    {"long": "Monthly", "short": "M"},
    {"long": "Yearly", "short": "Y"},
  ];

  String selectedFilter = "Daily";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: filterData.map((data) {
        bool isSelected = selectedFilter == data["long"];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedFilter = data["long"]!;
            });
          },
          // 1. GANTI Container JADI AnimatedContainer
          child: AnimatedContainer(
            // Wajib set durasi, misal 300 milidetik (0.3 detik)
            duration: const Duration(milliseconds: 300),
            // Curve biar gerakannya luwes (nggak kaku linear)
            curve: Curves.easeInOut,

            margin: const EdgeInsets.only(right: 10),
            height: 40,

            // Logika lebar & padding sama kayak tadi
            width: isSelected
                ? 100
                : 40, // Kasih angka pasti (misal 100) biar animasinya tau targetnya
            // Atau kalo mau width otomatis ikut teks, apus property width-nya, mainin padding aja:
            // padding: EdgeInsets.symmetric(horizontal: isSelected ? 20 : 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(20),
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ]
                  : [], // List kosong kalo gak aktif
            ),

            // 2. GANTI Text BIASA JADI AnimatedSwitcher
            // Ini biar pas ganti teks ada efek fade in/out
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                // Efeknya: Scale (membesar) + Fade
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                isSelected ? data["long"]! : data["short"]!,
                // PENTING: Key harus beda biar Flutter tau ini widget baru
                key: ValueKey<String>(
                  isSelected ? data["long"]! : data["short"]!,
                ),
                style: TextStyle(
                  color: Colors.amber[900],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
