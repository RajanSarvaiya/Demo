import 'package:flutter/material.dart';
import 'package:traning/widget/card_view.dart';
import 'package:traning/widget/text_widget.dart';

class ShowsDetailsScreen extends StatefulWidget {
  const ShowsDetailsScreen({super.key});

  @override
  State<ShowsDetailsScreen> createState() => _ShowsDetailsScreenState();
}

class _ShowsDetailsScreenState extends State<ShowsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: TextView(
          text: "Show Detail",
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          CardView(
            radiusbottomRight: 20,
            radiusbottomLeft: 20,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage("Assets/category1.png"),
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: "Under the Dome",
                  fontWeight: FontWeight.bold,
                  fontsize: 22,
                  textOverFlow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextView(
                          text: "Type: ",
                          fontWeight: FontWeight.bold,
                          fontsize: 18,
                          textOverFlow: TextOverflow.ellipsis,
                        ),
                        TextView(
                          text: "Scripted",
                          fontWeight: FontWeight.w400,
                          fontsize: 18,
                          textOverFlow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextView(
                          text: "Language: ",
                          fontWeight: FontWeight.bold,
                          fontsize: 18,
                          textOverFlow: TextOverflow.ellipsis,
                        ),
                        TextView(
                          text: "English",
                          fontWeight: FontWeight.w400,
                          fontsize: 18,
                          textOverFlow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                TextView(
                  text: "Description",
                  fontWeight: FontWeight.bold,
                  fontsize: 18,
                  textOverFlow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
