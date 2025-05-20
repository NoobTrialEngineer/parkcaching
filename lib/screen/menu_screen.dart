import 'package:flutter/material.dart';
import 'package:parkcaching_v3/screen/qr_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Images/background_menu.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(20),
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRScreen()),
                            );
                          },
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset(
                                  'assets/Images/scan_qr.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.black,
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    'Escanear QR',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            
                          },
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8, 
                                child: Image.asset(
                                  'assets/Images/proximamente.jpg',
                                  fit: BoxFit.cover,
                                  width: double
                                      .infinity, 
                                ),
                              ),
                              Expanded(
                                flex: 2, 
                                child: Container(
                                  color: Colors.black,
                                  alignment: Alignment.center,
                                  width: double
                                      .infinity,
                                  child: Text(
                                    'Proximamente...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero, 
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                          },
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8, // 80% del espacio
                                child: Image.asset(
                                  'assets/Images/proximamente.jpg',
                                  fit: BoxFit.cover,
                                  width: double
                                      .infinity, 
                                ),
                              ),
                              Expanded(
                                flex: 2, 
                                child: Container(
                                  color: Colors.black,
                                  alignment: Alignment.center,
                                  width: double
                                      .infinity, 
                                  child: Text(
                                    'Proximamente...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero, 
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                          
                          },
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset(
                                  'assets/Images/cerrar_sesion.jpeg',
                                  fit: BoxFit.cover,
                                  width: double
                                      .infinity, 
                                ),
                              ),
                              Expanded(
                                flex: 2, 
                                child: Container(
                                  color: Colors.red,
                                  alignment: Alignment.center,
                                  width: double
                                      .infinity, 
                                  child: Text(
                                    'Cerrar Sesión',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
