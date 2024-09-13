part of 'index.dart';

class SailingAvatar extends StatelessWidget {
  const SailingAvatar({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return TDAvatar(
        size: TDAvatarSize.large, type: TDAvatarType.normal, defaultUrl: src);
  }
}

class SailingMenuImage extends StatelessWidget {
  const SailingMenuImage({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      src,
      width: 32,
      height: 32,
    );
  }
}
