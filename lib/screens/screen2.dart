import 'package:flutter/material.dart';
import 'package:sports_betting_app/utils/colours.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackground,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: _CustomAppBar(
              colours: [
                kLightBlue,
                kPurple,
              ],
            ),
          ),
          const _HeadingsRow(),
          const _ProgressBar(
            title: 'Points',
            colours: [kPurple, kLightBlue],
            currentValue: '2.6354',
            maxValue: '3.00',
          ),
          const _ProgressBar(
            title: 'Total Tips',
            colours: [kRed, kOrange],
            currentValue: '142',
            maxValue: '200',
          ),
          const _ProgressBar(
            title: 'Success Rate',
            colours: [kBlueGreen, kGreen],
            currentValue: '75%',
            maxValue: '100%',
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Compare to Testimonials',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: _TestimonialCard(
                    name: 'Emma Stone',
                    numPoints: 20.047,
                    totalTips: 956,
                    successRate: 78,
                    imageURL: 'assets/Emma_Stone.jpg',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: _TestimonialCard(
                    name: 'Stephe',
                    numPoints: 41.053,
                    totalTips: 1736,
                    successRate: 65,
                    imageURL: 'assets/Stephe.jpg',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadingsRow extends StatelessWidget {
  const _HeadingsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Flexible(
            child: Text(
              'Placed Tips',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Flexible(
            child: Text(
              'Past Tips',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Statistics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: _CustomLinearProgressIndicator(
                    colours: [kPurple, kLightBlue],
                    currentValue: 20,
                    maxValue: 100,
                    hasBackground: false,
                  ),
                ),
              ],
            ),
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
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          const Positioned(
            top: 20,
            right: 20,
            child: Icon(Icons.settings, color: Colors.white),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/Face1.jpg',
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      '2.2356',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Points',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colours,
          stops: const [
            0.25,
            0.55,
          ],
          begin: const Alignment(1.5, -4.0),
          end: const Alignment(-2.5, 2.5),
        ),
      ),
    );
  }
}

class _CustomLinearProgressIndicator extends StatelessWidget {
  const _CustomLinearProgressIndicator(
      {Key key,
      @required this.colours,
      @required this.currentValue,
      @required this.maxValue,
      this.hasBackground = true})
      : super(key: key);

  final List<Color> colours;
  final double currentValue;
  final double maxValue;
  final bool hasBackground;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomLinearProgressIndicatorPainter(
          colours, currentValue, maxValue, hasBackground),
    );
  }
}

class _CustomLinearProgressIndicatorPainter extends CustomPainter {
  _CustomLinearProgressIndicatorPainter(
      this.colours, this.currentValue, this.maxValue, this.hasBackground);

  final List<Color> colours;
  final double currentValue;
  final double maxValue;
  final bool hasBackground;

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8
      ..shader = LinearGradient(
        colors: colours,
      ).createShader(Offset.zero &
          Size((currentValue / maxValue) * size.width, size.height));

    final backgroundLine = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..color = const Color(0xFF51535f);

    if (hasBackground)
      canvas.drawLine(
          Offset.zero, Offset(size.width, size.height), backgroundLine);

    canvas.drawLine(
        Offset.zero,
        Offset(((currentValue / maxValue) * size.width), size.height),
        gradient);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({
    @required this.title,
    @required this.colours,
    @required this.currentValue,
    @required this.maxValue,
  });

  final String title;
  final List<Color> colours;
  final String currentValue;
  final String maxValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                maxValue,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: _CustomLinearProgressIndicator(
                colours: colours,
                currentValue:
                    double.parse(currentValue.replaceAll(RegExp('%'), '')),
                maxValue: double.parse(maxValue.replaceAll(RegExp('%'), '')),
              ),
            ),
          ),
          Text(
            currentValue,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({
    Key key,
    @required this.name,
    @required this.numPoints,
    @required this.totalTips,
    @required this.successRate,
    @required this.imageURL,
  }) : super(key: key);

  final String name;
  final double numPoints;
  final String imageURL;
  final int totalTips;
  final double successRate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 70,
              decoration: const BoxDecoration(
                color: kLeagueCardBG,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 4),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 15,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(imageURL),
              ),
            ),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Averta',
              fontSize: 12,
            ),
            child: Positioned(
              top: 25,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('$numPoints Points'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Text('$totalTips Total Tips'),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text('${successRate.toInt()}% Success Rate'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
