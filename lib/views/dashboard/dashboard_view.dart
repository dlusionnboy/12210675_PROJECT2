import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project2/providers/dashboard_provider.dart';
import 'package:project2/views/dashboard/berita_panel.dart';
import 'package:project2/views/dashboard/pengaturan_panel.dart';
import 'package:project2/views/peta_view.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final panels = [dashboardPanel(), BeritaPanel(), PengaturanPanel()];
    return Consumer<DashboardProvider>(
      builder: (context, Provider, Widget) {
        return Scaffold(
            bottomNavigationBar: NavigatorBawah(),
            body: panels[Provider.tabaktif]);
      },
    );
  }
}

class dashboardPanel extends StatelessWidget {
  const dashboardPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/background.png'),
        informasiPengguna(),
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            margin: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  labelBerita(),
                  listBerita(),
                  SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    children: [
                      tombolMenu(
                          image: Image.asset(
                        'assets/ux.png',
                        width: 60,
                      )),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (bc) => PetaView()));
                        },
                        child: tombolMenu(
                          image: Image.asset(
                            'assets/map.png',
                            width: 60,
                          ),
                        ),
                      ),
                      tombolMenu(
                          image: Image.asset(
                        'assets/online-test.png',
                        width: 60,
                      )),
                      tombolMenu(
                          image: Image.asset(
                        'assets/monitor.png',
                        width: 60,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}

class tombolMenu extends StatelessWidget {
  final Image? image;
  const tombolMenu({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      child: Padding(
          padding: const EdgeInsets.all(18.0), child: image ?? SizedBox()),
    );
  }
}

class listBerita extends StatelessWidget {
  const listBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/maxresdefault (1).jpg',
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/maxresdefault.jpg',
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/OIP.jpeg',
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class labelBerita extends StatelessWidget {
  const labelBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(alignment: Alignment.centerLeft, child: Text('Berita')),
    );
  }
}

class NavigatorBawah extends StatelessWidget {
  const NavigatorBawah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final p = context.read<DashboardProvider>();

    return BottomNavigationBar(
      currentIndex: p.tabaktif,
      onTap: (value) {
        p.ubahTab(value);
        print("tab $value");
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: 'Dashboard'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper), label: 'Berita'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wrench), label: 'Pengaturan'),
      ],
    );
  }
}

class informasiPengguna extends StatelessWidget {
  const informasiPengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/profile.png',
              width: 60,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Deva',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'cyber8485@gmail.com',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/bell.png',
            width: 40,
          )
        ],
      ),
    );
  }
}
