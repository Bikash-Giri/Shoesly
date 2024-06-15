import 'package:flutter/material.dart';
import 'package:shoesly/components/src/gaps.dart';
import 'package:shoesly/resources/resources.dart';
import 'package:shoesly/resources/src/dimens.dart';
import 'package:shoesly/resources/src/theme_bloc.dart';
import 'package:shoesly/util/empty_util.dart';

enum ShoeslyButtonSize { primary, secondary, minimal }

enum IconLabelAlignment { vertical, horizontal }

class ShoeslyButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final TextStyle? style;
  final Color? color;
  final bool autoUnFocus;
  final Widget? icon;
  final bool iconLeading;
  final bool capitalize;
  final ShoeslyButtonSize buttonSize;
  final Color? backgroundColor;
  final double? minWidth;
  final double? minHeight;
  final IconLabelAlignment? iconLabelAlignment;

  /// When wrap is true, maxWidth is ignored
  final bool wrap;

  final _ShoeslyButtonType _buttonType;
  final BorderSide? _border;

  const ShoeslyButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: d_margin105),
    this.style,
    this.color,
    this.autoUnFocus = true,
    this.icon,
    this.iconLeading = true,
    this.capitalize = true,
    this.buttonSize = ShoeslyButtonSize.primary,
    this.minWidth,
    this.wrap = false,
  })  : _buttonType = _ShoeslyButtonType.pill,
        _border = null,
        backgroundColor = null,
        minHeight = null,
        iconLabelAlignment = null;

  const ShoeslyButton.outline({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: d_margin105),
    this.style,
    this.color,
    this.autoUnFocus = true,
    this.icon,
    this.iconLeading = true,
    this.capitalize = true,
    this.buttonSize = ShoeslyButtonSize.primary,
    this.backgroundColor,
    this.minWidth,
    this.wrap = false,
  })  : _buttonType = _ShoeslyButtonType.outline,
        _border = null,
        minHeight = null,
        iconLabelAlignment = null;

  const ShoeslyButton.flat({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: d_margin105),
    this.style,
    this.color,
    this.autoUnFocus = true,
    this.icon,
    this.iconLeading = true,
    this.capitalize = true,
    this.buttonSize = ShoeslyButtonSize.primary,
    this.minWidth,
    this.wrap = false,
    this.iconLabelAlignment = IconLabelAlignment.horizontal,
  })  : _buttonType = _ShoeslyButtonType.flat,
        _border = null,
        minHeight = null,
        backgroundColor = null;

  const ShoeslyButton.pill({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: d_margin105),
    this.style,
    this.color,
    this.autoUnFocus = true,
    this.icon,
    this.iconLeading = true,
    this.capitalize = true,
    this.buttonSize = ShoeslyButtonSize.primary,
    this.minWidth,
    this.wrap = false,
  })  : _buttonType = _ShoeslyButtonType.pill,
        backgroundColor = null,
        minHeight = null,
        _border = null,
        iconLabelAlignment = null;

  @override
  _ShoeslyButtonState createState() => _ShoeslyButtonState();
}

class _ShoeslyButtonState extends State<ShoeslyButton> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text =
        widget.capitalize ? widget.buttonText.toUpperCase() : widget.buttonText;
    final baseStyle = context.textTheme.headline300!
        .copyWith(fontSize: _dimension.fontSize, color: Colors.white);

    final textStyle = baseStyle.merge(widget.style?.copyWith(inherit: true));

    late final Widget child;

    if (widget.iconLabelAlignment == null ||
        widget.iconLabelAlignment == IconLabelAlignment.horizontal) {
      child = Text(text,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis);
    } else {
      final words = text.split(' ');
      if (words.length > 1) {
        child = Column(
          children: [for (final word in words) Text(word)],
        );
      } else {
        child = Text(text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis);
      }
    }

    Widget button = const SizedBox.shrink();
    switch (widget._buttonType) {
      // case _ShoeslyButtonType.primary:
      //   final hasIcon = widget.icon.isNotNull;
      //   final inheritedButtonStyle = ElevatedButtonTheme.of(context).style;
      //   final buttonStyle = ElevatedButton.styleFrom(
      //     foregroundColor: textStyle.color,
      //     textStyle: inheritedButtonStyle?.textStyle?.resolve({}) ?? textStyle,
      //     backgroundColor: widget.color ??
      //         inheritedButtonStyle?.backgroundColor?.resolve({}),
      //     padding: widget.padding,
      //     minimumSize: inheritedButtonStyle?.minimumSize?.resolve({}) ??
      //         Size(_dimension.minWidth, _dimension.height),
      //     // splashFactory: ShoeslyTheme.splashFactory,
      //   );
      //
      //   final elevatedButton = hasIcon
      //       ? ElevatedButton.icon(
      //           onPressed:
      //               widget.onPressed == null ? null : () => _onPressed(context),
      //           style: buttonStyle,
      //           icon: widget.icon!,
      //           label: child,
      //           focusNode: _focusNode,
      //         )
      //       : ElevatedButton(
      //           onPressed:
      //               widget.onPressed == null ? null : () => _onPressed(context),
      //           style: buttonStyle,
      //           focusNode: _focusNode,
      //           child: child,
      //         );
      //   button = widget.iconLeading
      //       ? elevatedButton
      //       : Directionality(
      //           textDirection: _textDirection, child: elevatedButton);
      case _ShoeslyButtonType.outline:
        final hasIcon = widget.icon.isNotNull;
        final buttonStyle = OutlinedButton.styleFrom(
          foregroundColor: widget.style?.color,
          textStyle: textStyle,
          side:
              BorderSide(color: widget.color ?? context.color.primary.shade200),
          padding: widget.padding,
          backgroundColor: widget.backgroundColor,
          minimumSize: Size(_dimension.minWidth, _dimension.height),
          // splashFactory: KhaltiTheme.splashFactory,
        );
        final outlineButton = hasIcon
            ? OutlinedButton.icon(
                onPressed:
                    widget.onPressed == null ? null : () => _onPressed(context),
                style: buttonStyle,
                icon: widget.icon!,
                label: child,
                focusNode: _focusNode,
              )
            : OutlinedButton(
                onPressed:
                    widget.onPressed == null ? null : () => _onPressed(context),
                style: buttonStyle,
                focusNode: _focusNode,
                child: child,
              );
        button = widget.iconLeading
            ? outlineButton
            : Directionality(
                textDirection: _textDirection, child: outlineButton);
        _focusNode.skipTraversal = true;
      case _ShoeslyButtonType.flat:
        final hasIcon = widget.icon.isNotNull;
        final iconLabelAlignment = widget.iconLabelAlignment!;
        final textButton = !hasIcon
            ? TextButton(
                onPressed:
                    widget.onPressed == null ? null : () => _onPressed(context),
                focusNode: _focusNode,
                child: child,
              )
            : iconLabelAlignment == IconLabelAlignment.horizontal
                ? TextButton.icon(
                    icon: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: d_iconMedium),
                      child: widget.icon!,
                    ),
                    label: child,
                    onPressed: widget.onPressed == null
                        ? null
                        : () => _onPressed(context),
                    focusNode: _focusNode,
                  )
                : TextButton(
                    onPressed: widget.onPressed == null
                        ? null
                        : () => _onPressed(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        widget.icon!,
                        const VerticalGap(d_margin105),
                        child,
                      ],
                    ),
                  );
        button = TextButtonTheme(
          data: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: widget.style?.color,
              textStyle: textStyle,
              padding: widget.padding,
              backgroundColor: widget.color ?? context.color.primary.shade900,
              minimumSize: Size(_dimension.minWidth, _dimension.height),
              // splashFactory: KhaltiTheme.splashFactory,
            ),
          ),
          child: widget.iconLeading
              ? textButton
              : Directionality(
                  textDirection: _textDirection, child: textButton),
        );
        _focusNode.skipTraversal = true;
      case _ShoeslyButtonType.pill:
        final hasIcon = widget.icon.isNotNull;
        final inheritedButtonStyle = ElevatedButtonTheme.of(context).style;
        final textStyle0 = widget.style.isNull
            ? textStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)
            : textStyle;
        final buttonStyle = ElevatedButton.styleFrom(
          foregroundColor: textStyle0.color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_dimension.height / 2)),
          backgroundColor: widget.color ?? context.color.primary.shade900,
          elevation: 0,
          textStyle: inheritedButtonStyle?.textStyle?.resolve({}) ?? textStyle0,
          padding: widget.padding,
          minimumSize: inheritedButtonStyle?.minimumSize?.resolve({}) ??
              Size(_dimension.minWidth, _dimension.height),
          // splashFactory: KhaltiTheme.splashFactory,
        );

        final elevatedButton = hasIcon
            ? ElevatedButton.icon(
                onPressed:
                    widget.onPressed == null ? null : () => _onPressed(context),
                icon: widget.icon!,
                style: buttonStyle,
                label: child,
                focusNode: _focusNode,
              )
            : ElevatedButton(
                onPressed:
                    widget.onPressed == null ? null : () => _onPressed(context),
                style: buttonStyle,
                focusNode: _focusNode,
                child: child,
              );

        button = widget.iconLeading
            ? elevatedButton
            : Directionality(
                textDirection: _textDirection, child: elevatedButton);
        _focusNode.skipTraversal = true;

        // final elevatedButton = hasIcon
        //     ? ElevatedButton.icon(
        //         onPressed:
        //             widget.onPressed == null ? null : () => _onPressed(context),
        //         icon: widget.icon!,
        //         style: buttonStyle,
        //         label: child,
        //         focusNode: _focusNode,
        //       )
        //     : ElevatedButton(
        //         onPressed:
        //             widget.onPressed == null ? null : () => _onPressed(context),
        //         style: buttonStyle,
        //         focusNode: _focusNode,
        //         child: child,
        //       );

        button = widget.iconLeading
            ? elevatedButton
            : Directionality(
                textDirection: _textDirection, child: elevatedButton);
        _focusNode.skipTraversal = true;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: _dimension.maxWidth,
        minWidth: _dimension.minWidth,
        maxHeight: _dimension.height,
        minHeight: _dimension.height,
      ),
      child: SelectionContainer.disabled(child: button),
    );
  }

  _ButtonDimension get _dimension {
    switch (widget.buttonSize) {
      case ShoeslyButtonSize.primary:
        return _ButtonDimension(
          maxWidth: double.maxFinite,
          minWidth: widget.minWidth ?? double.maxFinite,
          height: d_buttonHeight,
          fontSize: 17,
        );
      case ShoeslyButtonSize.secondary:
        assert(
            widget.minWidth.isNull || widget.minWidth! < d_largeButtonMaxWidth,
            'minWidth for Large Button cannot be less than 250.');
        return _ButtonDimension(
          maxWidth: widget.wrap ? double.infinity : d_largeButtonMaxWidth,
          minWidth: widget.minWidth ?? d_largeButtonMinWidth,
          height: d_buttonHeight,
          fontSize: 16,
        );
      case ShoeslyButtonSize.minimal:
        assert(
            widget.minWidth.isNull || widget.minWidth! < d_smallButtonMaxWidth,
            'minWidth for Small Button cannot be less than 160.');
        return _ButtonDimension(
          maxWidth: widget.wrap ? double.infinity : d_smallButtonMaxWidth,
          minWidth: widget.minWidth ?? d_smallButtonMinWidth,
          height: widget.iconLabelAlignment.isNull ||
                  widget.iconLabelAlignment == IconLabelAlignment.horizontal
              ? d_buttonHeightMini
              : d_margin12,
          fontSize: 14,
        );
      // case ShoeslyButtonSize.mini:
      //   assert(
      //       widget.minWidth.isNull || widget.minWidth! < d_miniButtonMaxWidth,
      //       'minWidth for Mini Button cannot be less than 108.');
      //   return _ButtonDimension(
      //     maxWidth: widget.wrap ? double.infinity : d_miniButtonMaxWidth,
      //     minWidth: widget.minWidth ?? d_miniButtonMinWidth,
      //     height: widget.minHeight ?? d_buttonHeightMini,
      //     fontSize: 12,
      //   );
    }
  }

  TextDirection get _textDirection =>
      widget.iconLeading ? TextDirection.ltr : TextDirection.rtl;

  void _onPressed(BuildContext context) {
    if (widget.autoUnFocus) FocusScope.of(context).unfocus();
    widget.onPressed!();
  }
}

// // TODO remove hard coded string
// class KhaltiAction extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String text;
//
//   const KhaltiAction({
//     super.key,
//     required this.onPressed,
//     required this.text,
//   });
//
//   const KhaltiAction.ok({
//     super.key,
//     required this.onPressed,
//   }) : text = s_ok;
//
//   const KhaltiAction.dismiss({
//     super.key,
//     required this.onPressed,
//   }) : text = 'Dismiss';
//
//   const KhaltiAction.goBack({
//     super.key,
//     required this.onPressed,
//   }) : text = s_goBack;
//
//   const KhaltiAction.cancel({
//     super.key,
//     required this.onPressed,
//   }) : text = s_cancel;
//
//   const KhaltiAction.confirm({
//     super.key,
//     required this.onPressed,
//   }) : text = s_confirm;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       style: TextButton.styleFrom(
//         foregroundColor: DefaultTextStyle.of(context).style.color,
//         splashFactory: KhaltiTheme.splashFactory,
//       ),
//       child: Text(text.loc.toUpperCase()),
//     );
//   }

class _ButtonDimension {
  final double minWidth;
  final double maxWidth;
  final double height;
  final double fontSize;

  const _ButtonDimension({
    required this.minWidth,
    required this.maxWidth,
    required this.height,
    required this.fontSize,
  });
}

enum _ShoeslyButtonType { outline, flat, pill }
