import 'package:flutter/material.dart';
import 'graph_time_filter.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Salam greetings
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Morning", style: TextStyle(fontSize: 15)),
                Text(
                  "Mr. Bagas Ramadhan Rusnadi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Saldo section
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.amber[200]),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Balanced", style: TextStyle(fontSize: 15)),
                Text(
                  "Rp 100.000.000.000",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Recent Activities
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Recent Activities",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber[700],
                          child: Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "Rp ${((index + 1) * 1000000).toString()}",
                          style: TextStyle(
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                          ),
                        ),
                        subtitle: Text("Title Of Transaction ${index + 1}"),
                        trailing: Text("01/01/2026"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Grafik section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Grafik Time Filter
                GraphTimeFilter(),

                SizedBox(height: 20),

                // Grafik Placeholder
                Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(300),
                      ),
                      child: Center(
                        child: Text(
                          "Graph Here",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
