import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'doa_model.dart';

class DoaScreen extends StatefulWidget {
  @override
  _DoaScreenState createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  List<Doa> doaList = []; // Menyimpan list doa yang diterima dari API
  bool isLoading = true; // Menandakan loading data dari API

  @override
  void initState() {
    super.initState();
    fetchDoaData(); // Mengambil data dari API saat aplikasi dimulai
  }

  // Fungsi untuk mengambil data dari API
  Future<void> fetchDoaData() async {
    final response = await http
        .get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        doaList = data
            .map((item) => Doa.fromJson(item))
            .toList(); // Mengubah data menjadi list Doa
        isLoading =
            false; // Mengubah status loading menjadi false setelah data berhasil diambil
      });
    } else {
      throw Exception('Failed to load doa data');
    }
  }

  // Fungsi untuk menampilkan detail doa
  void _showDoaDetails(BuildContext context, Doa doa) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(doa.doa),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Doa dalam Arab:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(doa.ayat, style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text("Doa dalam Latin:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(doa.latin, style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text("Arti Doa:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(doa.arti, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doa Harian'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Menampilkan loading indicator saat data sedang diambil
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: doaList.length,
              itemBuilder: (context, index) {
                Doa doa = doaList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        _showDoaDetails(context, doa); // Menampilkan detail doa
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.cyan],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              doa.doa,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
