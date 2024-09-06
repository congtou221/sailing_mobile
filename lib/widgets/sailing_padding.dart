part of 'index.dart';

class SailingPadding extends StatelessWidget {
  const SailingPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: spacingBase,
          right: spacingBase,
          top: spacingTight,
          bottom: spacingTight),
      child: child,
    );
  }
}

class SailingPaddingText extends StatelessWidget {
  const SailingPaddingText({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: spacingExtraTight),
      child: child,
    );
  }
}

class SailingPaddingEven extends StatelessWidget {
  const SailingPaddingEven({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacingBase),
      child: child,
    );
  }
}

class SailingPaddingTop extends StatelessWidget {
  const SailingPaddingTop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: spacingTight),
      child: child,
    );
  }
}

class SailingPaddingLeft extends StatelessWidget {
  const SailingPaddingLeft({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: spacingBase),
      child: child,
    );
  }
}

class SailingPaddingLeftRight extends StatelessWidget {
  const SailingPaddingLeftRight({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: spacingTight, right: spacingTight),
      child: child,
    );
  }
}

class SailingPaddingTopSafeArea extends StatelessWidget {
  const SailingPaddingTopSafeArea({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: safeAreaTop),
      child: child,
    );
  }
}
