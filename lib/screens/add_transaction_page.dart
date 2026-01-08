import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String categoryValue = "Income";
  String categoryChildValue = "Salary";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi There, please slowly add your transaction"),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Category Dropdown
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber[500],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: categoryValue,
                          dropdownColor: Colors.amber[600],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          items: [
                            DropdownMenuItem(
                              value: "Income",
                              child: Text("Income"),
                            ),
                            DropdownMenuItem(
                              value: "Expense",
                              child: Text("Expense"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              categoryValue = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      // Child Category Dropdown
                      DropdownButton<String>(
                        isExpanded: true,
                        underline: Container(
                          height: 1,
                          color: Colors.amber[800],
                        ),
                        value: categoryChildValue,
                        dropdownColor: Colors.amber[200],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        items: [
                          DropdownMenuItem(
                            value: "Salary",
                            child: Text("Salary"),
                          ),
                          DropdownMenuItem(
                            value: "Business",
                            child: Text("Business"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            categoryChildValue = value!;
                          });
                        },
                      ),

                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "Description",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber[800]!),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber[900]!),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      TextField(
                        readOnly: true,
                        // Lanjut buat masukkin input form buat tangga; ya
                        decoration: InputDecoration(labelText: "Tanggal"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 10,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Logic to add transaction
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        // Logic to add transaction
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
