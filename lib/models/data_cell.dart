import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'items_data.dart';

DataCell editableCell(BuildContext context, int index, String field, String value) {
  final itemData = Provider.of<ItemData>(context, listen: false);
  final controller = TextEditingController(text: value);

  return DataCell(
    GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Düzenle: $field'),
              content: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    itemData.updateItem(index, field, controller.text);
                    Navigator.of(context).pop();
                  },
                  child: Text('Kaydet'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('İptal'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0), // Hücre içindeki boşluk
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1.0), // Kenarlık rengi ve kalınlığı
        ),
        child: Text(value),
      ),
    ),
  );
}