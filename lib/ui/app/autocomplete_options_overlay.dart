import 'package:flutter/material.dart';

// RawAutocomplete limits hit testing to the field width. A separate overlay
// lets wider results receive clicks across their entire visible area.
class AutocompleteOptionsOverlay extends StatefulWidget {
  const AutocompleteOptionsOverlay({super.key, required this.child});

  final Widget child;

  @override
  State<AutocompleteOptionsOverlay> createState() =>
      _AutocompleteOptionsOverlayState();
}

class _AutocompleteOptionsOverlayState
    extends State<AutocompleteOptionsOverlay> {
  final _controller = OverlayPortalController()..show();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final width =
              constraints.maxWidth < 500 ? 500.0 : constraints.maxWidth;
          return OverlayPortal.overlayChildLayoutBuilder(
            controller: _controller,
            overlayChildBuilder: (context, layoutInfo) => Transform(
              transform: layoutInfo.childPaintTransform,
              child: Align(
                alignment: Alignment.topLeft,
                child: TextFieldTapRegion(
                  child: SizedBox(
                    width: width,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: constraints.maxHeight),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
            child: const SizedBox(width: double.infinity, height: 0),
          );
        },
      );
}
