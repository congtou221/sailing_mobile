part of 'index.dart';

class SailingContainer extends StatelessWidget {
  const SailingContainer({super.key, required this.child, this.onTap});

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ?? () => {},
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: child,
        ));
  }
}

class SailingExpandedContainer extends StatelessWidget {
  const SailingExpandedContainer({super.key, required this.child, this.onTap});

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ?? () => {},
        child: SailingContainer(
          child: Row(
            children: <Widget>[
              Expanded(
                // 使用 Expanded 来填充剩余空间
                child: child,
              ),
            ],
          ),
        ));
  }
}

class SailingExpandedAlignmentleftContainer extends StatelessWidget {
  const SailingExpandedAlignmentleftContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SailingExpandedContainer(
        child: Container(
      alignment: Alignment.centerLeft,
      child: child,
    ));
  }
}

class SailingExpandedAlignmentcenterContainer extends StatelessWidget {
  const SailingExpandedAlignmentcenterContainer(
      {super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SailingExpandedContainer(
        child: Container(
      alignment: Alignment.center,
      child: child,
    ));
  }
}
