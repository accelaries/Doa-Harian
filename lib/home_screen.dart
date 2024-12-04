import 'package:flutter/material.dart';
import 'doa_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/doa': (context) => DoaScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Waktu Sholat yang bisa diubah
  Map<String, String> prayerTimes = {
    'Shubuh': '05:00',
    'Dhuhur': '12:30',
    'Ashar': '15:45',
    'Maghrib': '18:00',
    'Isya': '19:15',
  };

  // Fungsi untuk mengubah waktu sholat
  void _changePrayerTime(String prayerName) {
    TextEditingController timeController =
        TextEditingController(text: prayerTimes[prayerName]);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 16.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ubah Waktu $prayerName",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: timeController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "Masukkan waktu baru (HH:mm)",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          prayerTimes[prayerName] = timeController.text;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Simpan"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Batal"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Fungsi untuk menavigasi ke halaman lain sesuai tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOAKU'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: _selectedIndex == 0
          ? _homeContent()
          : _selectedIndex == 1
              ? DoaScreen()
              : ProfileScreen(), // Menampilkan konten sesuai dengan tab yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blueAccent,
      ),
    );
  }

  Widget _homeContent() {
    return ListView(
      children: <Widget>[
        // Banner Gambar dengan efek gradient
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(
              image: NetworkImage(
                  'https://via.placeholder.com/400x200.png?text=Doa+Harian'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
            ),
          ),
          child: Center(
            child: Text(
              "Selamat datang di Aplikasi DOAKU",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        // Rekomendasi Doa
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rekomendasi Doa Hari Ini',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/doa');
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: Icon(Icons.book, size: 40, color: Colors.blue),
                    title: Text('Doa Sebelum Tidur',
                        style: TextStyle(fontSize: 18)),
                    subtitle: Text('Doa untuk perlindungan saat tidur'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/doa');
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: Icon(Icons.book, size: 40, color: Colors.blue),
                    title: Text('Doa Bangun Tidur',
                        style: TextStyle(fontSize: 18)),
                    subtitle: Text('Doa untuk mengawali hari dengan baik'),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Quotes Islami dengan style lebih menarik
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.blue[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kutipan Hari Ini:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '"Sesungguhnya dengan kesulitan ada kemudahan."',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- Al-Qur\'an (94:6)',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Waktu Sholat dengan tombol edit
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: prayerTimes.entries.map((entry) {
                return ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  leading:
                      Icon(Icons.access_time, size: 40, color: Colors.orange),
                  title: Text(entry.key),
                  subtitle: Text("Waktu: ${entry.value}"),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      _changePrayerTime(entry.key);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
