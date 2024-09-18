part of 'index.dart';

enum SailingPickerDirection {
  /// 向下
  down,

  /// 向上
  up,
}

class SailingPicker extends StatefulWidget {
  const SailingPicker({
    super.key,
    required this.defaultIndex,
    required this.list,
  });

  final int defaultIndex;
  final List<String> list;

  @override
  State<SailingPicker> createState() => _SailingPickerState();
}

class _SailingPickerState extends State<SailingPicker>
    with TickerProviderStateMixin {
  late int _currentIndex;
  SailingPickerDirection _direction = SailingPickerDirection.down;
  List<AnimationController>? _iconControllers;
  late List<Animation<double>> _iconAnimations;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _openMenu,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _renderTitle(),
          _renderIcon(),
        ]));
  }

  _init() {
    _currentIndex = widget.defaultIndex;
    _direction = SailingPickerDirection.down;
    _iconControllers?.forEach((controller) {
      controller.dispose();
    });
    _iconControllers = List.generate(
        widget.list?.length ?? 0,
        (index) => AnimationController(
              duration: Duration(milliseconds: (200).toInt()),
              vsync: this,
            ));
    _iconAnimations = _iconControllers
            ?.map((e) => Tween<double>(begin: 0, end: 0.5).animate(e))
            .toList() ??
        [];
  }

  Widget _renderTitle() {
    return TDText(widget.list[_currentIndex],
        font: TDTheme.of(context).fontBodyMedium,
        textColor: TDTheme.of(context).whiteColor1);
  }

  Widget _renderIcon() {
    var arrowIcon = (_direction == SailingPickerDirection.up
        ? TDIcons.caret_up_small
        : TDIcons.caret_down_small);
    return RotationTransition(
      turns: _iconAnimations[_currentIndex],
      child: Icon(arrowIcon, size: 24, color: TDTheme.of(context).whiteColor1),
    );
  }

  _openMenu() {
    Navigator.of(context).push(TDSlidePopupRoute(
        modalBarrierColor: TDTheme.of(context).fontGyColor2,
        slideTransitionFrom: SlideTransitionFrom.bottom,
        opened: () {
          setState(() {
            _direction = SailingPickerDirection.down;
            // _direction = SailingPickerDirection.up;
          });
        },
        builder: (context) {
          return SailingPopupBottomPanel(
              list: widget.list,
              selected: _currentIndex,
              onSelect: (index) => {
                    setState(() {
                      _currentIndex = index;
                    })
                  });
        }));
  }
}

class SailingPopupBottomPanel extends StatefulWidget {
  const SailingPopupBottomPanel({
    super.key,
    required this.list,
    required this.selected,
    required this.onSelect,
  });

  final List<String> list;
  final int selected;
  final Function(int) onSelect;

  @override
  State<SailingPopupBottomPanel> createState() => _SailingPopupBottomPanel();
}

class _SailingPopupBottomPanel extends State<SailingPopupBottomPanel> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selected;
  }

  @override
  void didUpdateWidget(SailingPopupBottomPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      setState(() {
        _selectedIndex = widget.selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TDTheme.of(context).whiteColor1,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TDTheme.of(context).radiusExtraLarge),
              topRight: Radius.circular(TDTheme.of(context).radiusExtraLarge))),
      height: MediaQuery.of(context).size.height / 2,
      child: SailingPaddingTopspacingExtraLoose(child: _renderPickerItem()),
    );
  }

  _renderPickerItem() {
    return TDCellGroup(
        cells: List.generate(widget.list.length, (index) {
      final item = widget.list[index];
      return TDCell(
        arrow: false,
        style: _getCustomTDCellStyle(_selectedIndex == index),
        title: item,
        onClick: (_cell) {
          widget.onSelect(index);
          setState(() {
            _selectedIndex = index;
          });
        }, // 可以根据需要添加逻辑
      );
    }));
  }

  _getCustomTDCellStyle(bool isSelected) {
    final style = TDCellStyle.cellStyle(context);
    style.titleStyle = TextStyle(
      color: isSelected
          ? TDTheme.of(context).brandColor4
          : TDTheme.of(context).fontGyColor1,
      height: TDTheme.of(context).fontBodyLarge?.height ?? 24,
      fontWeight: FontWeight.w400,
    );
    return style;
  }
}
