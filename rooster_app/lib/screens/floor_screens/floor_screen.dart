import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rooster_app/models/apartaments_models.dart';
import 'package:rooster_app/providers/apartaments_provider.dart';
import 'package:rooster_app/screens/apartaments_screens/apartament_details_screen.dart';
import 'package:rooster_app/screens/floor_screens/apartment_card.dart';
import 'package:rooster_app/screens/home_screen.dart/home_page.dart';

class FloorScreens extends StatefulWidget {
  const FloorScreens({super.key});

  @override
  State<FloorScreens> createState() => _FloorScreensState();
}

class _FloorScreensState extends State<FloorScreens> {
  @override
  Widget build(BuildContext context) {
    ApartamentsProvider apartamentsProvider =
        Provider.of<ApartamentsProvider>(context);
    return Scaffold(
      backgroundColor: Color(0XFFFd3e0f5),
      appBar: AppBar(
        backgroundColor: Color(0XFFFd3e0f5),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Container(
            // height: 100,
            // width: 100,
            decoration: BoxDecoration(
                //color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              size: 30,
            ),
          ),
        ),
        title: Text(
          "F L O O R    ${apartamentsProvider.selectedFloor}",
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: apartamentsProvider.floors.length,
                itemBuilder: (context, index) {
                  FloorModel floors = apartamentsProvider.floors[index];
                  return InkWell(
                    onTap: () {
                      apartamentsProvider.tapToSelectFloorNumber(
                          floors.floorNumber, index);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      decoration: BoxDecoration(
                          color: apartamentsProvider.selectedFloor ==
                                  floors.floorNumber
                              ? Colors.yellow
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Floor ${floors.floorNumber}",
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ApartamentsDetailsScreen()),
            );
          },
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (!apartamentsProvider.swipeProcessed) {
                if (details.delta.dx < 0) {
                  apartamentsProvider.swipeToIncrementSelectFloorNumber();
                } else if (details.delta.dx > 0) {
                  apartamentsProvider.swipeToDecrementSelectFloorNumber();
                }
              }
            },
            onHorizontalDragEnd: (details) {
              apartamentsProvider.stopDecInc();
            },
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: apartamentsProvider
                    .floors[apartamentsProvider.floorIndex].apartaments!.length,
                itemBuilder: (context, index) {
                  ApartamentsModels apartaments = apartamentsProvider
                      .floors[apartamentsProvider.floorIndex]
                      .apartaments![index];
                  return Column(
                    children: [
                      ApartamentCard(
                        text: "A P A R T M E N T  ${apartaments.roomNumber}",
                        avaibleText:
                            apartaments.avaiable! ? "AVAIBLE" : "NON AVAIABLE",
                        avaibleIcon: apartaments.avaiable! ? true : false,
                        roomType: apartaments.rooms!,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
