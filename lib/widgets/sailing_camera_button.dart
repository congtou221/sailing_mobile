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

class SailingCameraButton extends StatelessWidget {
  const SailingCameraButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: CustomPaint(
          painter: ConcentricCirclePainter(),
          size: Size(widthSmallItem, widthSmallItem),
        ));
  }
}
