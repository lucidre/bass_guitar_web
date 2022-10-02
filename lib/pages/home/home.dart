import 'dart:math';

import 'package:bass_guitar_web/constants/numbers.dart';
import 'package:bass_guitar_web/constants/style.dart';
import 'package:bass_guitar_web/models/guitar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

const _duration = Duration(milliseconds: 500);
final _rnd = Random();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollNotifier = ValueNotifier(0.0);
  int _fullScreenIndex = -1;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final currentPosition = _controller.position.pixels;
      _scrollNotifier.value = currentPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          child: ValueListenableBuilder<double>(
            valueListenable: _scrollNotifier,
            builder: (_, scroll, __) => ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: guitars.length,
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final guitar = guitars[index];
                return _HomeItem(
                    isOpen: _fullScreenIndex == index,
                    guitar: guitar,
                    onTap: () {
                      if (_fullScreenIndex == index) {
                        _fullScreenIndex = -1;
                        setState(() {});
                      } else {
                        _fullScreenIndex = index;
                        setState(() {});
                        final double width = (300 * index) -
                            ((MediaQuery.of(context).size.width - 1000) / 2);

                        _controller.animateTo(width,
                            duration: _duration, curve: Curves.easeIn);
                      }
                    });
              }),
            ),
          )),
    );
  }
}

class _HomeItem extends StatelessWidget {
  final bool isOpen;
  final Guitar guitar;

  final VoidCallback onTap;
  const _HomeItem(
      {Key? key,
      required this.isOpen,
      required this.guitar,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: lightColor);
    final bodyText2 =
        textTheme.bodyText2?.copyWith(color: lightColor.withOpacity(.8));
    const double width = 1000;
    return AnimatedContainer(
      duration: _duration,
      height: double.infinity,
      width: isOpen ? width : 300,
      color: guitar.color,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Stack(
          children: [
            if (isOpen)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: guitar.color,
                    width: width / 2,
                    child: Stack(
                      children: [
                        Image.asset(
                          guitar.imageBg,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        )
                            .animate()
                            .fade(duration: const Duration(milliseconds: 200)),
                        Positioned.fill(
                            child: Container(
                          color: guitar.color.withOpacity(
                            .5,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            Positioned.fill(
              top: kDefaultMargin / 2,
              left: kDefaultMargin / 2,
              bottom: kDefaultMargin / 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        guitar.index.toString().length == 1
                            ? '0${guitar.index}'
                            : guitar.index.toString(),
                        style: bodyText1?.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          .animate(delay: const Duration(milliseconds: 200))
                          .move(duration: _duration)
                          .fade(duration: _duration),
                      if (isOpen) ...[
                        const Spacer(),
                        Text(
                          guitar.name.toUpperCase(),
                          style: bodyText1?.copyWith(fontSize: 40),
                        ),
                        const SizedBox(
                          height: kDefaultMargin / 2,
                        ),
                        Text(
                          guitar.playerName,
                          style: bodyText2,
                        )
                            .animate(delay: const Duration(milliseconds: 400))
                            .fade(duration: _duration),
                        const SizedBox(
                          height: kDefaultMargin / 2,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            guitar.description,
                            style: bodyText2,
                          ),
                        )
                            .animate(delay: const Duration(milliseconds: 200))
                            .fade(duration: _duration),
                        const SizedBox(
                          height: kDefaultMargin * 2,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: kDefaultPadding / 2),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: lightColor, width: 2),
                            ),
                          ),
                          child: Text(
                            "LEARN MORE",
                            style: bodyText1?.copyWith(
                                fontSize: bodyText2?.fontSize),
                          ),
                        )
                            .animate(delay: const Duration(milliseconds: 200))
                            .fade(duration: _duration),
                        const SizedBox(
                          height: kDefaultMargin * 2,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: lighten(guitar.color),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.pause_rounded,
                                color: lightColor,
                              ),
                            ),
                            const SizedBox(
                              width: kDefaultMargin / 2,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                musicBar(),
                                const SizedBox(
                                  height: kDefaultMargin / 4,
                                ),
                                Text(
                                  guitar.audioName,
                                  style: bodyText1?.copyWith(
                                      fontSize: bodyText2!.fontSize! + 2),
                                ),
                                Text(
                                  guitar.audioGerne,
                                  style: bodyText2,
                                ),
                              ],
                            ))
                          ],
                        )
                            .animate(delay: const Duration(milliseconds: 200))
                            .fade(duration: _duration),
                        const SizedBox(
                          height: kDefaultMargin / 2,
                        ),
                      ],
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: _duration,
              top: isOpen ? -kDefaultMargin * 15 : kDefaultMargin,
              bottom: isOpen ? kDefaultMargin * 2 : kDefaultMargin,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  guitar.image,
                  fit: BoxFit.fitHeight,
                ),
              )
                  .animate(delay: const Duration(milliseconds: 200))
                  .fade(duration: _duration),
            ),
            Positioned(
              right: kDefaultMargin / 2,
              top: kDefaultMargin,
              child: AnimatedSwitcher(
                duration: _duration,
                child: isOpen
                    ? const SizedBox()
                    : RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                guitar.playerName,
                                style: bodyText2,
                              ),
                              Text(
                                guitar.name,
                                style: bodyText1,
                              ),
                            ]),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget musicBar() {
    List<Widget> heights = [];
    for (var i = 0; i < 30; i++) {
      heights.add(Container(
        height: _rnd.nextInt(36) + 5,
        width: 3,
        margin: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
          color: i < 15 ? lightColor : darkColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ));
    }
    return Row(
      children: heights,
    );
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
