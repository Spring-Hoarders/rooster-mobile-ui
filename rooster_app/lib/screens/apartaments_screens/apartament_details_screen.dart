import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rooster_app/screens/apartaments_screens/client_card.dart';
import 'package:rooster_app/screens/floor_screens/apartment_card.dart';
import 'package:rooster_app/screens/floor_screens/floor_screen.dart';

class ApartamentsDetailsScreen extends StatefulWidget {
  const ApartamentsDetailsScreen({super.key});

  @override
  _ApartamentsDetailsScreenState createState() =>
      _ApartamentsDetailsScreenState();
}

class _ApartamentsDetailsScreenState extends State<ApartamentsDetailsScreen>
    with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];
  List<Animation<Offset>> _offsets = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 3; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      );
      final offset = Tween<Offset>(
        begin: Offset(0, -1.0), // Cards start off the screen
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

      _controllers.add(controller);
      _offsets.add(offset);

      // Start the animations with a delay
      Future.delayed(Duration(milliseconds: i * 250), () {
        controller.forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFd3e0f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FloorScreens(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Text(
                        "S T U D E N T",
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _offsets[0],
                      builder: (context, child) {
                        return SlideTransition(
                          position: _offsets[0],
                          child: ClientCard(
                            name: "MATEO DOKA",
                            phone: "  +355684458530",
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _offsets[1],
                      builder: (context, child) {
                        return SlideTransition(
                          position: _offsets[1],
                          child: ClientCard(
                            name: "MATEO DOKA",
                            phone: "  +355684458530",
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _offsets[2],
                      builder: (context, child) {
                        return SlideTransition(
                          position: _offsets[2],
                          child: ClientCard(
                            name: "MATEO DOKA",
                            phone: "  +355684458530",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
