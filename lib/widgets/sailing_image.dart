part of 'index.dart';

class SailingAvatarLarge extends StatelessWidget {
  const SailingAvatarLarge({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return TDAvatar(
        size: TDAvatarSize.large, type: TDAvatarType.normal, defaultUrl: src);
  }
}

class SailingAvatarMedium extends StatelessWidget {
  const SailingAvatarMedium({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return TDAvatar(
        size: TDAvatarSize.medium, type: TDAvatarType.normal, avatarUrl: src);
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
