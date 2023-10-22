import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rooster_app/screens/home_screen.dart/building_details.dart';
import 'package:rooster_app/screens/home_screen.dart/home_page.dart';

class ApartamentCard extends StatelessWidget {
  final String text;
  final String avaibleText;
  final bool avaibleIcon;
  final String roomType;
  const ApartamentCard({
    super.key,
    required this.text,
    required this.avaibleText,
    required this.avaibleIcon,
    required this.roomType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.plusJakartaSans(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BuildingDetails(
                            icon: FontAwesomeIcons.peopleGroup,
                            text: " 2/3",
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BuildingDetails(
                            icon: FontAwesomeIcons.house,
                            text: roomType,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BuildingDetails(
                              icon: avaibleIcon
                                  ? FontAwesomeIcons.circleCheck
                                  : FontAwesomeIcons.circleXmark,
                              text: avaibleText,
                              color: avaibleIcon ? Colors.green : Colors.red),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Image.network(
                      "https://img.freepik.com/premium-vector/closed-wooden-door-with-rug-welcome_273525-807.jpg",
                      width: 190,
                      height: 200,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
