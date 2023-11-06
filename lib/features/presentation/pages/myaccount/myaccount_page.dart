import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  MyAccountPage({super.key});
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => route.isFirst,
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 74,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                    radius: 70, backgroundImage: AssetImage('assets/poto.png')),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 24),
                  padding: EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 15,
                        )
                      ]),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Nama"),
                        subtitle: Text("Fajar Triatmojo"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text("Negara"),
                        subtitle: Text("Indonesia"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.home_work_outlined),
                        title: Text("Alamat"),
                        subtitle: Text("Malang, Jawa Timur"),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
