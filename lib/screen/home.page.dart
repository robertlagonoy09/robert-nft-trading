import 'package:flutter/material.dart';
import '../widgets/nft_card.dart';
import '../services/nft_service.dart';
import 'gallery_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> _nfts = [];

  @override
  void initState() {
    super.initState();
    _loadNfts();
  }

  _loadNfts() async {
    List<Map> loadedNfts = await NftService.getNfts();
    setState(() {
      _nfts = loadedNfts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text('Robert NFT Marketplace', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFFC107))),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107), foregroundColor: Colors.black, minimumSize: Size(double.infinity, 50)),
                onPressed: () {},
                child: Text('Connect Pi Wallet'),
              ),
            ),
            GestureDetector(
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage())); },
              child: Container(height: 150, margin: EdgeInsets.all(20), decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Color(0xFF1A1A1A), border: Border.all(color: Color(0xFFFFC107))), child: Center(child: Text('+ Add NFT', style: TextStyle(color: Color(0xFFFFC107), fontSize: 20)))),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('🔥 Featured NFTs', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 20),
                  Container(
                    height: 260,
                    child: _nfts.isEmpty
                    ? Center(child: Text('Wala pang NFT. Mag-add ka muna!', style: TextStyle(color: Colors.grey)))
                      : ListView.builder(scrollDirection: Axis.horizontal, itemCount: _nfts.length, itemBuilder: (context, index) {
                          var nft = _nfts[index];
                          return NftCard(name: nft['name'], price: nft['price'], image: nft['image'], seller: nft['seller']);
                        }),
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