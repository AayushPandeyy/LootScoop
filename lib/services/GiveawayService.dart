import 'dart:convert';

import 'package:free_game_notifier_app/model/Giveaway.dart';
import 'package:http/http.dart' as http;

class GiveawayService {
  Future<List<Giveaway>> getAllGiveaways() async {
    const url = "https://www.gamerpower.com/api/giveaways";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Giveaway> giveaways =
          data.map((dynamic item) => Giveaway.fromJson(item)).toList();
      return giveaways;
    } else {
      throw Exception("Failed to Load giveaways");
    }
  }
}
