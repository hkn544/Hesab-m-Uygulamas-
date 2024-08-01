import 'package:flutter/cupertino.dart';
import 'item.dart';
class ItemData extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(String title, String date, String amount) {
    _items.add(Item(title: title, date: date,amount:  amount));
    notifyListeners();
  }

  void updateItem(int index, String field, String newValue) {
    if (field == 'title') {
      _items[index] = Item(title: newValue, date: _items[index].date,amount:  _items[index].amount);
    } else if (field == 'date') {
      _items[index] = Item(title: _items[index].title,date:  newValue,amount:  _items[index].amount);
    } else if (field == 'amount') {
      _items[index] = Item(title: _items[index].title,date:  _items[index].date,amount:  newValue);
    }
    notifyListeners(); // Tabloyu güncellemek için dinleyicilere bildirim gönderir
  }
}