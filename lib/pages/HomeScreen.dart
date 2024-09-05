import 'package:flutter/material.dart';
import 'package:free_game_notifier_app/model/Giveaway.dart';
import 'package:free_game_notifier_app/services/GiveawayService.dart';
import 'package:free_game_notifier_app/widgets/CustomDrawer.dart';
import 'package:free_game_notifier_app/widgets/GiveawayTile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Giveaway> giveaways = [];
  List<Giveaway> gameGiveaways = [];
  bool isLoading = false;
  final service = GiveawayService();

  @override
  void initState() {
    super.initState();
    fetchAllGiveaways();
  }

  void fetchAllGiveaways() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await service.getAllGiveaways();
      setState(() {
        giveaways = data;
        gameGiveaways = giveaways.where((ga) => ga.type == "Game").toList();
      });
    } catch (err) {
      print(err);
    } finally {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('GamerPower Giveaways'),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: gameGiveaways.length,
                itemBuilder: (context, index) {
                  return GiveawayTile(
                    description: gameGiveaways[index].description,
                    title: gameGiveaways[index].title,
                    imageUrl: gameGiveaways[index].image,
                    worth: gameGiveaways[index].worth,
                  );
                }));
  }
}
