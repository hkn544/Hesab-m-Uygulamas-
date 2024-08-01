import 'package:flutter/material.dart';
import 'package:gelir_tablosu/models/items_data.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class ItemAdder extends StatefulWidget {
  ItemAdder({super.key});

  @override
  State<ItemAdder> createState() => _ItemAdderState();
}

class _ItemAdderState extends State<ItemAdder> {
  final textController = TextEditingController();

  int currentDataIndex = 0;

  String? title;

  String? date;

  String? amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
              onChanged: (input) {
                print(textController.text);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'AÇIKLAMA',
                hintText: 'AÇIKLAMA GİRİNİZ...',
              ),
              autofocus: true,

            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentDataIndex == 0) {
                    title = textController.text;
                    currentDataIndex++;
                    textController.clear(); // Alanı temizle
                  } else if (currentDataIndex == 1) {
                    date = textController.text;
                    currentDataIndex++;
                    textController.clear(); // Alanı temizle
                  } else if (currentDataIndex == 2) {
                    amount = textController.text;
                    Provider.of<ItemData>(context, listen: false).addItem(title ?? '', date ?? '', amount ?? '');
                    currentDataIndex = 0;
                    textController.clear(); // Alanı temizle
                    Navigator.of(context).pop(); // son veriyi aldığında sayfayı kapat
                  }
                });

              },

              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
