import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rooster_app/screens/floor_screens/floor_screen.dart';
import 'package:rooster_app/screens/home_screen.dart/building_details.dart';
import 'package:rooster_app/screens/home_screen.dart/home_page.dart';

class BuildingsCard extends StatelessWidget {
  final Function() onTap;
  final String text;
  const BuildingsCard({Key? key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: GoogleFonts.plusJakartaSans(
                            color: Color.fromARGB(255, 224, 155, 107),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BuildingDetails(
                            icon: FontAwesomeIcons.house,
                            text: "15/35",
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BuildingDetails(
                            icon: FontAwesomeIcons.person,
                            text: "90/180",
                            color: Colors.green!,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BuildingDetails(
                            icon: FontAwesomeIcons.stairs,
                            text: "10",
                            color: Colors.blue!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.network(
                    "https://img.freepik.com/premium-vector/vector-tall-building-with-windows-against-flat-background_176841-7432.jpg",
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
