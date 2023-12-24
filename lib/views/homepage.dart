import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Candi Boom'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Nama Pengguna',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    String username = _usernameController.text;
                    print('Memulai game dengan nama pengguna: $username');
                    // Add navigation or game start logic here
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('Membuka pengaturan');
                    // Add navigation or settings logic here
                  },
                  icon: Icon(Icons.settings),
                  label: Text('Setting'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}