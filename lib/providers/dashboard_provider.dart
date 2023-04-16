import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project2/models/berita_model.dart';
import 'package:http/http.dart' as http;

class DashboardProvider with ChangeNotifier {
  int tabaktif = 0;

  void ubahTab(int index) {
    tabaktif = index;
    notifyListeners();
  }

  void saatdiklik(int value) {}
}

class BertaPanelProvier with ChangeNotifier {
  bool modecari = false;

  void ubahMode() {
    modecari = !modecari;
    notifyListeners();
  }
}

class BeritaLoadDataProvider with ChangeNotifier {
  List<BeritaModel> data = [];

  Future refresh() async {
    final alamat =
        'http://api.mediastack.com/v1/news?access_key=934198eb698fc70dbdd5d2e30d06b5e3';
    final hasil = await http.get(Uri.parse(alamat));
    if (hasil.statusCode != 200) return [];

    final obj = jsonDecode(hasil.body);

    data.clear();
    for (var n in obj['data']) {
      data.add(BeritaModel.fromMap(n));
    }
    notifyListeners();
  }
}
