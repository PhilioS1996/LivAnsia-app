import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;
import '../helpers/imports.dart';

class AnimateLogo extends StatefulWidget {
  AnimateLogo({Key? key}) : super(key: key);

  @override
  State<AnimateLogo> createState() => _AnimateLogoState();
}

class _AnimateLogoState extends State<AnimateLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 5), vsync: this);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.2, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        titleTop(context),
        SlideTransition(
          position: _offsetAnimation,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20),
            child: Image(
              width: 150,
              image: AssetImage(
                "assets/6logo.png",
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget titleTop(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: MediaQuery.of(context).size.height / 2.6,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(200),
          ) // green shaped
          ),
    ),
  );
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
