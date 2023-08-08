// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        extendBodyBehindAppBar: true,
        appBar: const MyAppBar(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [const ImageAuthor(), PlayerControl()],
          ),
        ));
  }
}

class ImageAuthor extends StatelessWidget {
  const ImageAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 550.0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/musique_1.jpg'), fit: BoxFit.cover)),
      child: const Stack(children: [
        Positioned(top: 60.0, left: 130, child: TitleSection()),
        ArtistPictureSection(),
      ]),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Column(
          children: [
            Text(
              "Artist",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w300,
                  fontSize: 14.0,
                  color: Colors.white),
            ),
            Text('Ariana Grande',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w800,
                    fontSize: 17.0,
                    color: Colors.white))
          ],
        )
      ]),
    );
  }
}

class ArtistPictureSection extends StatelessWidget {
  const ArtistPictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlayerControl extends StatelessWidget {
  const PlayerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      color: Colors.white,
      // child: const Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     PlayingMusicTitle(),
      //     MusicSliderSection(),
      //     DurationSection(),
      //     MusicControlButtonSection()
      //   ],
      // ),
    );
  }
}
