import 'package:flutter/material.dart';
import 'package:gelir_tablosu/models/items_data.dart';
import 'package:provider/provider.dart';
import 'item_adder.dart';
import 'package:gelir_tablosu/models/data_cell.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  int index = 0;
   String data1= 'data1';
   String data2 = 'data2';
   String data3 = 'data3';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gelir Gider Tablosu'),

      ),
      body: Consumer<ItemData>(
        builder: (context, itemData, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Açıklama')),
                DataColumn(label: Text('Tarih')),
                DataColumn(label: Text('Tutar')),
              ],
              rows: List<DataRow>.generate(
                itemData.items.length,
                    (index) {
                  final item = itemData.items[index];
                  return DataRow(
                    cells: [
                      editableCell(context, index, 'title', item.title ?? ''),
                      editableCell(context, index, 'date', item.date ?? ''),
                      editableCell(context, index, 'amount', item.amount ?? ''),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context ,builder: (context) => ItemAdder(),
          );
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}


