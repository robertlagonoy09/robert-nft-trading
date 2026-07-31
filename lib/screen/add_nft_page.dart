import 'package:flutter/material.dart';
import '../services/nft_service.dart';

class AddNftPage extends StatefulWidget {
  @override
  _AddNftPageState createState() => _AddNftPageState();
}

class _AddNftPageState extends State<AddNftPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Mint New NFT'), backgroundColor: Color(0xFF1A1A1A)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _nameController, style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'NFT Name', labelStyle: TextStyle(color: Color(0xFFFFC107)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFC107))))),
            SizedBox(height: 15),
            TextField(controller: _priceController, style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'Price in Pi', labelStyle: TextStyle(color: Color(0xFFFFC107)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFC107))))),
            SizedBox(height: 15),
            TextField(controller: _descController, style: TextStyle(color: Colors.white), maxLines: 3, decoration: InputDecoration(labelText: 'Description', labelStyle: TextStyle(color: Color(0xFFFFC107)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFC107))))),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107), foregroundColor: Colors.black, minimumSize: Size(double.infinity, 50)),
              onPressed: () async {
                Map newNft = {
                  'name': _nameController.text,
                  'price': _priceController.text,
                  'desc': _descController.text,
                  'image': 'https://via.placeholder.com/200/FFC107/000',
                  'seller': 'you'
                };
                await NftService.saveNft(newNft);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('NFT Saved Successfully!')));
                Navigator.pop(context);
              },
              child: Text('Mint NFT'),
            ),
          ],
        ),
      ),
    );
  }
}