import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComponentDropdown<T> extends StatefulWidget {

  final Widget child;
  final void Function(T, int) onChange;
  final List<DropdownItem<T>> items;
  final Icon? icon;
  final bool hideIcon;
  final bool leadingIcon;

  late DropdownStyle dropdownStyle;
  late DropdownButtonStyle dropdownButtonStyle;

  ComponentDropdown({
    Key? key,
    required this.child,
    required this.items,
    required this.dropdownStyle,
    required this.dropdownButtonStyle,
    required this.onChange,
    this.icon,
    this.hideIcon = false,
    this.leadingIcon = false,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<ComponentDropdown<T>> with TickerProviderStateMixin {
  
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200)
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {

    var style = widget.dropdownButtonStyle;

    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: style.width,
        height: style.height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: style.padding,
            backgroundColor: style.backgroundColor,
            elevation: style.elevation,
            primary: style.primaryColor,
            // shape: style.shape,
          ),
          onPressed: _toggleDropdown,
          child: Row(
            mainAxisAlignment:
            style.mainAxisAlignment,
            textDirection:
            widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_currentIndex == -1) ...[
                widget.child,
              ] else ...[
                widget.items[_currentIndex],
              ],
              if (!widget.hideIcon)
                RotationTransition(
                  turns: _rotateAnimation,
                  child: widget.icon ?? const Icon(Icons.arrow_drop_down),
                ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset:
                  widget.dropdownStyle.offset ?? Offset(0, size.height + 5),
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle.elevation,
                    borderRadius:
                    widget.dropdownStyle.borderRadius,
                    color: widget.dropdownStyle.color,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: widget.dropdownStyle.constraints ??
                            BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height -
                                  topOffset -
                                  15,
                            ),
                        child: ListView(
                          padding:
                          widget.dropdownStyle.padding,
                          shrinkWrap: true,
                          children: widget.items.asMap().entries.map((item) {
                            return InkWell(
                              onTap: () {
                                setState(() => _currentIndex = item.key);
                                widget.onChange(item.value.value, item.key);
                                _toggleDropdown();
                              },
                              child: item.value,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

class DropdownItem<T> extends StatelessWidget {
  
  final T value;
  final Widget child;

  const DropdownItem({Key? key, required this.value, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
  
}

class DropdownButtonStyle {
  
  final MainAxisAlignment mainAxisAlignment;
  final double elevation;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double width;
  final double height;
  final Color primaryColor;
  final ShapeBorder? shape;
  final BoxConstraints? constraints;
  
  const DropdownButtonStyle({
    required this.mainAxisAlignment,
    required this.backgroundColor,
    required this.primaryColor,
    required this.height,
    required this.width,
    required this.elevation,
    required this.padding,
    this.shape,
    this.constraints,
  });
  
}

class DropdownStyle {

  final EdgeInsets padding;
  final double elevation;
  final BorderRadius borderRadius;

  final Color? color;
  final BoxConstraints? constraints;
  final Offset? offset;
  final double? width;

  const DropdownStyle({
    required this.borderRadius,
    required this.elevation,
    required this.padding,
    this.color,
    this.constraints,
    this.offset,
    this.width,

  });
}