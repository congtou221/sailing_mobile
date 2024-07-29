part of 'index.dart';

class SailingPadding extends StatelessWidget {
  const SailingPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
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
      padding: const EdgeInsets.only(top: 4.0),
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
      padding: const EdgeInsets.all(16.0),
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
      padding: const EdgeInsets.only(top: 8.0),
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
      padding: const EdgeInsets.only(left: 16.0),
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
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: child,
    );
  }
}
