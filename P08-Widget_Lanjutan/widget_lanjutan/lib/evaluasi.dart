import 'package:flutter/material.dart';
import 'package:widget_lanjutan/ninethpage.dart';

class EvaluasiPage extends StatefulWidget {
  @override
  _EvaluasiPageState createState() => _EvaluasiPageState();
}

class _EvaluasiPageState extends State<EvaluasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluasi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Visi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
                "Prodi D4 Rekayasa Perangkat Lunak yang telah ditetapkan oleh Direktur Politeknik Negeri Bengkalis melalui surat keputusan No. 2061/PL31/TU/2016 adalah"),
            // SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                text:
                    '“Menjadi Program Studi vokasi yang menghasilkan lulusan bidang '
                    'rekayasa perangkat lunak berstandar Nasional dan menuju reputasi '
                    'Internasional pada tahun 2020”.',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Misi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Misi Program Studi Sarjana Terapan Rekayasa Perangkat Lunak adalah:',
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Menyelenggarakan pendidikan dan meningkatkan kemampuan mahasiswa '
                    'dalam menerapkan Ilmu Pengetahuan dan Teknologi Rekayasa Perangkat '
                    'Lunak bidang Rekayasa web dan Aplikasi mobile untuk meningkatkan daya '
                    'saing yang tinggi.',
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '2. Menciptakan, mengembangkan dan menerapkan ilmu pengetahuan dan '
                    'teknologi untuk menghasilkan produk unggulan rekayasa perangkat lunak.',
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '3. Meningkatkan pemanfaatan teknologi informasi dalam mengatasi '
                    'permasalahan-permasalahan di lingkungan internal maupun lingkungan '
                    'eksternal (industri, pemerintah dan masyarakat umum).',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
