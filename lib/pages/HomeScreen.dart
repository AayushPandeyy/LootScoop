import 'package:flutter/material.dart';
import 'package:free_game_notifier_app/model/Giveaway.dart';
import 'package:free_game_notifier_app/services/GiveawayService.dart';
import 'package:free_game_notifier_app/widgets/GiveawayTile.dart';

import 'package:url_launcher/url_launcher.dart';

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

  String url = "https://www.gamerpower.com/api/giveaways";
  void fetchAllGiveaways() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await service.getAllGiveaways(url);
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'LootScoop',
            style: TextStyle(fontSize: 30, fontFamily: "Debug"),
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      color: Colors.red,
                      onRefresh: () async {
                        fetchAllGiveaways();
                      },
                      child: ListView.builder(
                          itemCount: gameGiveaways.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GiveawayTile(
                                  endDate: gameGiveaways[index].end_date,
                                  description: gameGiveaways[index].description,
                                  title: gameGiveaways[index].title,
                                  imageUrl: gameGiveaways[index].image,
                                  worth: gameGiveaways[index].worth,
                                  url: gameGiveaways[index].openGiveawayUrl,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.grey,
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              ));
  }
}
