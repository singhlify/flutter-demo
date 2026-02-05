import 'package:flutter/widgets.dart';
import 'package:fluent_ui/fluent_ui.dart';

/// A ribbon group with a bottom label and a vertical divider.
/// Matches MS Word's ribbon group layout: controls on top, label at bottom, divider on right.
class RibbonGroup extends StatelessWidget {
  const RibbonGroup({
    super.key,
    required this.label,
    required this.children,
    this.showTrailingDivider = false,
  });

  final String label;
  final List<Widget> children;
  final bool showTrailingDivider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Controls area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  ),
                ),
              ),
              // Label at bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(width: 2),
                    // Small dialog launcher arrow
                    const Icon(
                      FluentIcons.open_16_regular,
                      size: 8,
                      color: Color(0xFF888888),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showTrailingDivider)
          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(vertical: 4),
            color: const Color(0xFFD6D6D6),
          ),
      ],
    );
  }
}

/// Large ribbon button with icon on top and label below (like Paste, Styles, Editing, Dictate, etc.)
class RibbonLargeButton extends StatefulWidget {
  const RibbonLargeButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.hasDropdown = false,
    this.iconColor,
    this.iconSize = 24,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool hasDropdown;
  final Color? iconColor;
  final double iconSize;

  @override
  State<RibbonLargeButton> createState() => _RibbonLargeButtonState();
}

class _RibbonLargeButtonState extends State<RibbonLargeButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 52,
          padding: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: _hovering ? const Color(0xFFE0E0E0) : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: widget.iconSize, color: widget.iconColor ?? const Color(0xFF444444)),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      widget.label,
                      style: const TextStyle(fontSize: 10, color: Color(0xFF444444)),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  if (widget.hasDropdown)
                    const Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Icon(FluentIcons.chevron_down_12_regular, size: 8, color: Color(0xFF888888)),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small ribbon icon button with hover effect
class RibbonSmallButton extends StatefulWidget {
  const RibbonSmallButton({
    super.key,
    required this.icon,
    this.tooltip = '',
    this.onPressed,
    this.isToggled = false,
    this.iconSize = 16,
    this.iconColor,
    this.hasDropdown = false,
    this.underlineColor,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool isToggled;
  final double iconSize;
  final Color? iconColor;
  final bool hasDropdown;
  final Color? underlineColor;

  @override
  State<RibbonSmallButton> createState() => _RibbonSmallButtonState();
}

class _RibbonSmallButtonState extends State<RibbonSmallButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: widget.hasDropdown ? 30 : 24,
            height: 24,
            decoration: BoxDecoration(
              color: widget.isToggled
                  ? const Color(0xFFD0E0F0)
                  : (_hovering ? const Color(0xFFE0E0E0) : Colors.transparent),
              borderRadius: BorderRadius.circular(2),
              border: widget.isToggled ? Border.all(color: const Color(0xFF2B579A).withValues(alpha: 0.4)) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon, size: widget.iconSize, color: widget.iconColor ?? const Color(0xFF444444)),
                    if (widget.underlineColor != null)
                      Container(
                        width: widget.iconSize,
                        height: 2,
                        color: widget.underlineColor,
                      ),
                  ],
                ),
                if (widget.hasDropdown)
                  const Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: Icon(FluentIcons.chevron_down_12_regular, size: 7, color: Color(0xFF888888)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
