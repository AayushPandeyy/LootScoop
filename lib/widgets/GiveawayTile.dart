import 'package:flutter/material.dart';
import 'package:free_game_notifier_app/widgets/CustomButton.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class GiveawayTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String worth;
  final String description;
  final String endDate;
  final String url;

  const GiveawayTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.worth,
      required this.description,
      required this.endDate,
      required this.url});

  String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} days';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes';
    } else {
      return '${duration.inSeconds} seconds';
    }

    // Combine all non-empty parts
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    String endDateString;
    // Get the current date-time
    if (endDate != "N/A") {
      final format = DateFormat("yyyy-MM-dd HH:mm:ss");
      String givenDateTime =
          DateFormat("yyyy-MM-dd HH:mm:ss").format(format.parse(endDate));
      DateTime now = DateTime.now();
      Duration difference = DateTime.parse(givenDateTime).difference(now);
      endDateString = formatDuration(difference);
    } else {
      endDateString = "";
    }

    // Calculate the difference
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
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
                        textAlign: TextAlign.center,
                        title,
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "MarkoOne"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
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
                endDate != "N/A"
                    ? Text(
                        "Ends In : ${endDateString}",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Container(),
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
                CustomButton(
                  text: "Grab The Loot 💸",
                  onPress: () {
                    print("pressed");
                    launchUrl(Uri.parse(url));
                    print("launched");
                  },
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
