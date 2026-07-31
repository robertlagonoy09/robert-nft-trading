import 'package:flutter/material.dart';
import 'add_nft_page.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('My Gallery'), backgroundColor: Color(0xFF1A1A1A)),
      body: Center(child: Text('Dito lalabas lahat ng NFT mo', style: TextStyle(color: Colors.white))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFC107),
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AddNftPage())); },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}