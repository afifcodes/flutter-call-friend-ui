import 'package:flutter/material.dart';
import 'package:flutter_call_friend_ui/utils/fade_animation.dart';
import 'package:flutter_call_friend_ui/utils/route_arguments.dart';
import 'package:flutter_call_friend_ui/utils/system_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    systemUI();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Call A Friend',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              'instagram @afifcodes',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 12),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            left: (MediaQuery.of(context).size.width / 2) - 32,
            child: const FadeAnimation(
              delay: 0,
              child: PersonCard(
                name: "Humeyra",
                imageUrl: "humeyra.jpg",
              ),
            ),
          ),
          const Positioned(
            top: 300,
            left: 48,
            child: FadeAnimation(
                delay: 200,
                child: PersonCard(
                  name: "Jeffery",
                  imageUrl: "jeffery-erhunse.jpg",
                )),
          ),
          const Positioned(
            top: 300,
            right: 48,
            child: FadeAnimation(
                delay: 400,
                child:
                    PersonCard(name: 'Jonas', imageUrl: 'jonas-kakaroto.jpg')),
          ),
          const Positioned(
            bottom: 200,
            left: 84,
            child: FadeAnimation(
                delay: 600,
                child: PersonCard(
                  name: 'Molly',
                  imageUrl: 'molly-blackbird.jpg',
                )),
          ),
          const Positioned(
            bottom: 200,
            right: 84,
            child: FadeAnimation(
              delay: 800,
              child:
                  PersonCard(name: 'Sergio', imageUrl: 'sergio-de-paula.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  const PersonCard({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/call',
                arguments: CallScreenArguments(name, imageUrl));
          },
          child: Hero(
            tag: imageUrl,
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/${imageUrl}'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700]),
        )
      ],
    );
  }
}
