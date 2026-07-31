import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NftService {
  static Future<void> saveNft(Map nft) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> nfts = prefs.getStringList('nfts') ?? [];
    nfts.add(json.encode(nft));
    await prefs.setStringList('nfts', nfts);
  }

  static Future<List<Map>> getNfts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> nfts = prefs.getStringList('nfts') ?? [];
    return nfts.map((nft) => json.decode(nft)).toList();
  }
}