part of 'index.dart';

class ConcentricCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // 创建画笔
    final outerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // 绘制外圈
    canvas.drawCircle(center, size.width * 0.5, outerPaint);

    // 绘制内圈
    canvas.drawCircle(center, size.width * 0.42, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SailingCameraButton extends StatefulWidget {
  const SailingCameraButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<SailingCameraButton> createState() => _SailingCameraButtonState();
}

class _SailingCameraButtonState extends State<SailingCameraButton>
    with SingleTickerProviderStateMixin {
  final Duration _duration = const Duration(milliseconds: 100);
  late AnimationController _animationController;
  late double _scale;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animationController.value;
    return GestureDetector(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Transform.scale(
            scale: _scale,
            child: CustomPaint(
              painter: ConcentricCirclePainter(),
              size: Size(widthSmallItem, widthSmallItem),
            )));
  }

  _onTapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    _animationController.forward();
  }

  _onTapUp(TapUpDetails details) {
    Future.delayed(_duration, () {
      _animationController.reverse();
    });

    // widget.onTap?.call();
  }
}
