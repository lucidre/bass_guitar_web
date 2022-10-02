import 'package:bass_guitar_web/constants/strings.dart';
import 'package:flutter/material.dart';

class Guitar {
  final String image;
  final String imageBg;
  final int index;
  final String name;
  final String playerName;
  final String description;
  final String audioName;
  final String audioGerne;
  final Color color;
  Guitar(
      {required this.image,
      required this.imageBg,
      required this.index,
      required this.name,
      required this.playerName,
      required this.description,
      required this.audioName,
      required this.color,
      required this.audioGerne});
}

final List<Guitar> guitars = [
  Guitar(
      image: guitar1,
      imageBg: guitarBg1,
      index: 0,
      name: "Fender Stratocaster",
      playerName: "Eric Clapton",
      description:
          "It’s hard to overstate the influence of the Stratocaster. A tremendous pedigree of electric guitarists have made history on this type of guitar. It’s been reissued in hundreds of different designs and is by far one of the most popular types of electric guitars. The slanted, double-cutout body and three-pickup control setup give the Stratocaster both a visual signature and sonic versatility. ",
      audioName: "Wish You Were Here",
      color: const Color(0xFF813F06),
      audioGerne: "Solid-Body Electric"),
  Guitar(
      image: guitar2,
      imageBg: guitarBg2,
      index: 1,
      name: "Martin D-45",
      playerName: "Neil Young",
      description:
          "For most guitar enthusiasts today, this is what “playing the guitar” means: the snap and brightness of a 6-string steel, which has strong projection and durability. Many guitarists favor the versatility and clarity of dreadnoughts, but especially singer-songwriters. ",
      audioName: "Fire and Rain",
      color: const Color(0xFFC59A51),
      audioGerne: "Steel String Dreadnought Acoustic"),
  Guitar(
      image: guitar3,
      imageBg: guitarBg3,
      index: 2,
      name: "1969 José Ramírez 1a “AM” ",
      playerName: "Andres Segovia",
      description:
          "Singer-songwriter Jason Mraz and fingerstyle genius Earl Klugh favor classical guitars for their round, sweet tone and stability when playing complex lines. These tend to have higher actions (the distance between the strings and fingerboard) and wider necks than many other acoustics. ",
      audioName: "Hotel California",
      color: const Color(0xFF851917),
      audioGerne: "Classical Nylon Acoustic Dreadnought"),
  Guitar(
      image: guitar4,
      imageBg: guitarBg4,
      index: 3,
      name: "Gibson ES-175",
      playerName: "Wes Montgomery",
      description:
          "The Gibson ES-175 has become the iconic example that represents an entire class of guitars: hollow-body electrics. The rich, mid-range tone of these guitars was made legendary in jazz by players such as Joe Pass and Wes Montgomery. (Although the guitar has subsequently found its way into a myriad of other popular styles). Check out the haunting ballad “Round Midnight” below. ",
      audioName: "Blackbird",
      color: const Color(0xFF61606C),
      audioGerne: "Hollow-Body Electric"),
  Guitar(
      image: guitar6,
      imageBg: guitarBg6,
      index: 5,
      name: "Muddywood",
      playerName: "Billy Gibbon’s",
      description:
          "Muddywood isn’t a guitar that Gibbons has toted around on the road and played the crap out of, it’s more of a tribute guitar to Muddy Waters. It was built from cypress beams that were once a part of the cabin that Muddy Waters grew up in, at Stovall Farms, in Missisippi.",
      audioName: "Wonderwall",
      color: const Color(0xFF823D1D),
      audioGerne: "Steel String Dreadnought Acoustic"),
  Guitar(
      image: guitar7,
      imageBg: guitarBg7,
      index: 6,
      name: "Washburn Dimebag",
      playerName: "Paul McCartney",
      description:
          "The tone of this bass is instantly recognizable to any Beatles fan. The emphasis in the mid range and the plunky attack gave a unique flavor to dozens of Beatles songs, such as “When I’m 64.” Paul also liked the balance it created on stage, given the fact that he played left handed and the bass was a symmetrical body design. See this late performance of “Don’t Let Me Down” to feel the magic for yourself.",
      audioName: "More Than Words",
      color: const Color(0xFF610104),
      audioGerne: "Hollow-Body Electric"),
  Guitar(
      image: guitar8,
      imageBg: guitarBg8,
      index: 7,
      name: "Ibanez TAM 100 ",
      playerName: "Tosin Abasi",
      description:
          "Certain players have been able to define the creative direction of a genre purely on the basis of their ability and artistic vision. Tosin Abasi is one such artist who brought the use of 7+ string guitars into greater favor among progressive metal players. For guitarists who just can’t get enough notes, this guitar itself can be the inspiration for the music. ",
      audioName: "Dust in the Wind",
      color: const Color(0xFFE7E5DF),
      audioGerne: "Hollow-Body Electric"),
  Guitar(
      image: guitar9,
      imageBg: guitarBg9,
      index: 8,
      name: "FrankenStrat",
      playerName: "Billy Gibbon’s",
      description:
          "Muddywood isn’t a guitar that Gibbons has toted around on the road and played the crap out of, it’s more of a tribute guitar to Muddy Waters. It was built from cypress beams that were once a part of the cabin that Muddy Waters grew up in, at Stovall Farms, in Missisippi.",
      audioName: "Sound of Silence",
      color: const Color(0xFF3B2373),
      audioGerne: "Steel String Dreadnought Acoustic"),
  Guitar(
      image: guitar10,
      imageBg: guitarBg10,
      index: 9,
      name: "The Twang Machine",
      playerName: "Paul McCartney",
      description:
          "The tone of this bass is instantly recognizable to any Beatles fan. The emphasis in the mid range and the plunky attack gave a unique flavor to dozens of Beatles songs, such as “When I’m 64.” Paul also liked the balance it created on stage, given the fact that he played left handed and the bass was a symmetrical body design. See this late performance of “Don’t Let Me Down” to feel the magic for yourself.",
      audioName: "Stairway to Heaven",
      color: const Color(0xFFDFDEDE),
      audioGerne: "Steel String Dreadnought Acoustic"),
];
