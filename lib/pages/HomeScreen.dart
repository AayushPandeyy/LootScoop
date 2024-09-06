import 'package:flutter/material.dart';
import 'package:free_game_notifier_app/model/Giveaway.dart';
import 'package:free_game_notifier_app/services/GiveawayService.dart';
import 'package:free_game_notifier_app/widgets/CustomButton.dart';
import 'package:free_game_notifier_app/widgets/CustomDrawer.dart';
import 'package:free_game_notifier_app/widgets/GiveawayTile.dart';

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
    fetchAllGiveaways(url);
  }

  String url = "https://www.gamerpower.com/api/giveaways";
  void fetchAllGiveaways(String url) async {
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
    final List<String> _types = ["Game", "Loot", "Beta release"];
    final List<String> platforms = [
      'PC',
      'Steam',
      'Epic Games Store',
      'itch.io',
      'GOG',
      'Xbox One',
      'PS4',
      'Nintendo',
      'Android',
      'iOS',
      'DRM-Free',
    ];

    // Selected dropdown item
    String? _selectedType = "";
    String? _selectedPlatform = "";
    return Scaffold(
        drawer: CustomDrawer(),
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
                ],
              ));
  }
}
