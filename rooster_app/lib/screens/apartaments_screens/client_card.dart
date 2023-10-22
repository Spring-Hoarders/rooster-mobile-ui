import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rooster_app/screens/contract_screens/contract.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.name, required this.phone});
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => ContractFormPage(),
        // ));
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                            "https://creazilla-store.fra1.digitaloceanspaces.com/icons/7912642/avatar-icon-md.png"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.phone,
                          size: 20,
                        ),
                        Text(
                          phone,
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
