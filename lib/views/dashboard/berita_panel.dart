import 'package:flutter/material.dart';
import 'package:project2/models/berita_model.dart';
import 'package:project2/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaLoadDataProvider>().refresh();

    return Scaffold(body:
        Consumer<BeritaLoadDataProvider>(builder: (context, Provider, Widget) {
      return ListView(
        children: [for (BeritaModel bm in Provider.data) itemBerita(bm)],
      );
    }));
  }

  Container itemBerita(BeritaModel bm) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
            ),
            Image.network(
              bm.image ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/noimage.png');
              },
            ),
            Text('${bm.title}')
          ],
        ),
      ),
    );
  }
}
