import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkcaching_v3/screen/ar_screen.dart';

class ReadyForARScreen extends StatefulWidget {
  final String qrCodeResult;
  ReadyForARScreen(this.qrCodeResult);

  @override
  _ReadyForARScreenState createState() => _ReadyForARScreenState();
}

class _ReadyForARScreenState extends State<ReadyForARScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String name = '';
  String description = '';
  String arObject = '';
  String urlImage = '';

  @override
  void initState() {
    super.initState();
    getARObjectByName(widget.qrCodeResult);
  }

  Future<Map<String, dynamic>> getARObjectByName(String name) async {
    Map<String, dynamic> place = {};

    try {
      QuerySnapshot querySnapshot = await db
          .collection('places')
          .where('name', isEqualTo: name)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        place = documentSnapshot.data() as Map<String, dynamic>;

        String _placeName = place['name'];
        String _description = place['description'];
        String _arObject = place['ar_object'];
        String _urlImage = place['url_image'];

        setState(() {
          name = _placeName;
          description = _description;
          arObject = _arObject;
          urlImage = _urlImage;
        });

      } else {
        print("No document found with the name: $name");
      }
    } catch (e) {
      print("Error obteniendo persona: $e");
    }

    return place;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/Images/background_login.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (urlImage.isNotEmpty)
                  Image.network(urlImage, height: 200, fit: BoxFit.cover),
                SizedBox(height: 20),
                if (name.isNotEmpty)
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 10),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 20),
                Text(
                  '¿Desea verlo en realidad aumentada?',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ARScreen(
                          name: widget.qrCodeResult,
                          description: description,
                          arObject: arObject,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Ver en AR',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}