import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project2/views/dashboard/dashboard_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            judulLogin(),
            Image.asset(
              'assets/user.png',
              width: 120,
            ),
            Card(
              color: Color.fromARGB(255, 0, 0, 0),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  formInputan(),
                  formInputan(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (bc) {
                        return DashboardView();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text('Login'),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding formInputan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(17))),
            fillColor: Colors.grey[50],
            filled: true),
      ),
    );
  }
}

class judulLogin extends StatelessWidget {
  const judulLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text(
        'Aplikasi \nPendataan Warga',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
