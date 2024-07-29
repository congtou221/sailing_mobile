part of 'index.dart';

class SailingRowSpaceBetween extends StatelessWidget {
  const SailingRowSpaceBetween({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
