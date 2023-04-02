import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            judulLogin(),
            stackGambar(),
          ],
        ),
      ),
    );
  }

  Stack stackGambar() {
    return Stack(
      children: [
        Container(
          height: 380,
          child: Card(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            color: Color.fromARGB(255, 221, 98, 57),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                formInputan(),
                formInputan(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: Color.fromARGB(255, 0, 0, 0)),
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
            child: Image.asset(
          'assets/ancestors.png',
          width: 115,
        )),
      ],
    );
  }

  Padding formInputan() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
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
