import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String categoryValue = "Income";
  String categoryChildValue = "Salary";
  // DateTime selectedDate = DateTime.now();

  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Set default tanggal hari ini pas aplikasi dibuka
    dateController.text = DateFormat('dd MMMM yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
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
                        autofocus: false,
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: "Description",
                          alignLabelWithHint: true,
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
                        controller: dateController,
                        // Lanjut buat masukkin input form buat tangga; ya
                        decoration: InputDecoration(
                          labelText: "Date",
                          hintText: "Select Date",
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber[800]!),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber[900]!),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat(
                              'dd MMMM yyyy',
                            ).format(pickedDate);
                            setState(() {
                              dateController.text = formattedDate;
                            });
                          }
                        },
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
