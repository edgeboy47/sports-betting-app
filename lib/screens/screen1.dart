import 'package:flutter/material.dart';
import 'package:sports_betting_app/utils/colours.dart';

// Screen 1
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colours = [
      kRed,
      kOrange,
    ];

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _CustomAppBar(
            colours: colours,
          ),
        ),
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  color: kBackground,
                ),
              ),
              WaveForm(
                colours: colours,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: kBackground,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                CategoriesStack(
                  title: 'Leagues',
                  children: [
                    LeagueCard(
                      title: 'Bundesliga',
                      headerLetter: 'B',
                      colour: kRed,
                    ),
                    LeagueCard(
                      title: 'Premier League',
                      headerLetter: 'P',
                      colour: kPurple,
                    ),
                    LeagueCard(
                      title: 'League One',
                      headerLetter: 'L',
                      colour: const Color.fromRGBO(34, 45, 255, 1),
                    )
                  ],
                ),
                CategoriesStack(
                  title: 'World Championship',
                  children: [
                    LeagueCard(
                      title: 'Group A',
                      headerLetter: 'A',
                      colour: const Color.fromRGBO(27, 161, 212, 1),
                    ),
                    LeagueCard(
                      title: 'Group B',
                      headerLetter: 'B',
                      colour: const Color.fromRGBO(44, 209, 140, 1),
                    ),
                    LeagueCard(
                      title: 'Group C',
                      headerLetter: 'C',
                      colour: const Color.fromRGBO(236, 36, 65, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WaveForm extends StatelessWidget {
  const WaveForm({Key key, @required this.colours})
      : assert(colours != null),
        super(key: key);

  final List<Color> colours;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return CustomPaint(
      painter: BoxShadowPainter(),
      child: ClipPath(
        clipper: CurveClipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(1, 0),
              radius: 7.5,
              colors: colours.reversed.toList(),
            ),
          ),
          height: screenSize.height * 0.08,
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Auto generated using Figma and https://itchylabs.com/tools/path-to-bezier/
    final path = Path();
    final _xScaling = size.width / 411;
    final _yScaling = size.height / 80.13;
    path
      ..lineTo(0 * _xScaling, 51.787 * _yScaling)
      ..cubicTo(
        0 * _xScaling,
        51.787 * _yScaling,
        23 * _xScaling,
        61.787 * _yScaling,
        23 * _xScaling,
        61.787 * _yScaling,
      )
      ..cubicTo(
        53 * _xScaling,
        71.4184 * _yScaling,
        94.5 * _xScaling,
        88.4184 * _yScaling,
        140.5 * _xScaling,
        75.4184 * _yScaling,
      )
      ..cubicTo(
        186.5 * _xScaling,
        63.4184 * _yScaling,
        228 * _xScaling,
        28.7871 * _yScaling,
        274 * _xScaling,
        24.7871 * _yScaling,
      )
      ..cubicTo(
        320 * _xScaling,
        20.7871 * _yScaling,
        365 * _xScaling,
        41.787 * _yScaling,
        388 * _xScaling,
        51.787 * _yScaling,
      )
      ..cubicTo(
        388 * _xScaling,
        51.787 * _yScaling,
        411 * _xScaling,
        61.787 * _yScaling,
        411 * _xScaling,
        61.787 * _yScaling,
      )
      ..cubicTo(
        411 * _xScaling,
        61.787 * _yScaling,
        411 * _xScaling,
        0.0000122543 * _yScaling,
        411 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        411 * _xScaling,
        0.0000122543 * _yScaling,
        406 * _xScaling,
        0.0000122543 * _yScaling,
        406 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        406 * _xScaling,
        0.0000122543 * _yScaling,
        396.5 * _xScaling,
        0.0000122543 * _yScaling,
        396.5 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        396.5 * _xScaling,
        0.0000122543 * _yScaling,
        385 * _xScaling,
        0.0000122543 * _yScaling,
        385 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        362 * _xScaling,
        0.0000122543 * _yScaling,
        317 * _xScaling,
        0.0000122543 * _yScaling,
        271 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        226.5 * _xScaling,
        0.0000122543 * _yScaling,
        178.5 * _xScaling,
        0.0000417501 * _yScaling,
        132.5 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        89.5 * _xScaling,
        -0.0000153179 * _yScaling,
        42 * _xScaling,
        0.0000122543 * _yScaling,
        19 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        19 * _xScaling,
        0.0000122543 * _yScaling,
        0 * _xScaling,
        0.0000122543 * _yScaling,
        0 * _xScaling,
        0.0000122543 * _yScaling,
      )
      ..cubicTo(
        0 * _xScaling,
        0.0000122543 * _yScaling,
        0 * _xScaling,
        51.787 * _yScaling,
        0 * _xScaling,
        51.787 * _yScaling,
      )
      ..cubicTo(
        0 * _xScaling,
        51.787 * _yScaling,
        0 * _xScaling,
        51.787 * _yScaling,
        0 * _xScaling,
        51.787 * _yScaling,
      );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lightPath = CurveClipper().getClip(size).shift(const Offset(0, 8));
    final medPath = CurveClipper().getClip(size).shift(const Offset(0, 6));
    final darkPath = CurveClipper().getClip(size).shift(const Offset(0, 4));

    final lightShadow = const BoxShadow(
      blurRadius: 4.0,
      color: Colors.black45,
    ).toPaint();

    final medShadow = const BoxShadow(
      blurRadius: 3.0,
      color: Colors.black54,
    ).toPaint();

    final darkShadow = const BoxShadow(
      blurRadius: 2.0,
      color: Colors.black87,
    ).toPaint();

    canvas
      ..drawPath(lightPath, lightShadow)
      ..drawPath(medPath, medShadow)
      ..drawPath(darkPath, darkShadow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CategoriesStack extends StatelessWidget {
  const CategoriesStack({
    @required this.title,
    @required this.children,
  })  : assert(title != null),
        assert(children != null && children.length == 3);

  final String title;

  final List<LeagueCard> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.5,
      child: Stack(
        children: [
          Positioned(
            top: -30,
            child: Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                color: kBGText,
                fontSize: 180,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenSize.width,
                height: 15,
              ),
              ...children,
              SizedBox(
                width: screenSize.width,
                height: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  _CustomAppBar({@required this.colours}) : assert(colours != null);

  final List<Color> colours;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
          size: 36.0,
        ),
        title: headerText('TipHero'),
        subtitle: headerText('No Money∙Just Win'),
        trailing: const Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
          size: 36.0,
        ),
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(1, 0),
          radius: 7.5,
          colors: colours.reversed.toList(),
        ),
      ),
    );
  }

  Text headerText(String s) => Text(
        s,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
}

class LeagueCard extends StatelessWidget {
  LeagueCard({
    @required this.title,
    @required this.headerLetter,
    @required this.colour,
  }) : assert(title != null && colour != null && headerLetter != null);

  final String title;
  final String headerLetter;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: kLeagueCardBG,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0, 4),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.only(left: 60, top: 20),
              child: Text(
                title,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -28,
          left: 40,
          child: Text(
            headerLetter,
            style: TextStyle(
              color: colour,
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: -24,
          right: 30,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: colour,
            child: const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
