import 'package:flutter/material.dart';
import 'package:free_game_notifier_app/widgets/CustomButton.dart';

class GiveawayTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String worth;
  final String description;

  const GiveawayTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.worth,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 215, // Adjust height as needed
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "NewAmsterdam"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      worth,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Free",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                      fontFamily: "Gabarito"),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16.0),
                CustomButton(text: "Grab The Loot 💸", onPress: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
