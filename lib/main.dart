import 'package:flutter/material.dart';
import 'package:project2/providers/dashboard_provider.dart';
import 'package:project2/views/login_view.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (bc) => DashboardProvider()),
        ChangeNotifierProvider(create: (bc) => BertaPanelProvier()),
        ChangeNotifierProvider(create: (bc) => BeritaLoadDataProvider()),
      ],
      builder: (context, Widget) {
        return MaterialApp(home: LoginView());
      }));
}
