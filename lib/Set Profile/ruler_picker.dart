import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScalePicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onChanged;
  final String unit;
  final bool isVertical;

  const CustomScalePicker({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChanged,
    this.unit = "",
    this.isVertical = false,
  }) : super(key: key);

  @override
  _CustomScalePickerState createState() => _CustomScalePickerState();
}

class _CustomScalePickerState extends State<CustomScalePicker> {
  late ScrollController _scrollController;
  late double _currentValue;
  final double _itemExtent = 60.0; // Adjusted for better spacing and scaling

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue.toDouble();
    _scrollController = ScrollController();

    // Ensure the initial scroll offset is set only after the layout is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialOffset =
          ((_currentValue - widget.minValue) * _itemExtent) -
              (MediaQuery.of(context).size.width / 2 - _itemExtent / 2);
      _scrollController.jumpTo(initialOffset);
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final double offset = (_scrollController.offset +
        MediaQuery.of(context).size.width / 2 -
        _itemExtent / 2) /
        _itemExtent;
    final int newValue = (widget.minValue + offset.round())
        .clamp(widget.minValue, widget.maxValue);

    if (_currentValue.toInt() != newValue) {
      setState(() {
        _currentValue = newValue.toDouble();
        widget.onChanged(newValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display the selected value
        Text(
          "${_currentValue.toInt()} ${widget.unit}",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 50.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        // Scale container
        Container(
          height: widget.isVertical ? 300.h : 100.h,
          width: widget.isVertical ? 100.w : double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // The scale
              ListView.builder(
                controller: _scrollController,
                scrollDirection:
                widget.isVertical ? Axis.vertical : Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.maxValue - widget.minValue + 1,
                itemBuilder: (context, index) {
                  final value = widget.minValue + index;
                  final isHighlighted = value == _currentValue.toInt();

                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: widget.isVertical ? double.infinity : _itemExtent,
                      height:
                      widget.isVertical ? _itemExtent : double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: isHighlighted
                                ? (widget.isVertical ? 50.h : 40.h)
                                : 20.h,
                            width: isHighlighted ? 3.w : 1.5.w,
                            color: isHighlighted
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.grey.shade300,
                          ),
                          const SizedBox(height: 10),
                          if (value % 5 == 0)
                            Text(
                              value.toString(),
                              style: TextStyle(
                                fontSize: isHighlighted ? 18.sp : 12.sp,
                                fontWeight: isHighlighted
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isHighlighted
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Colors.grey.shade300,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              // Central marker line
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: widget.isVertical ? 60.w : 2.w,
                    height: widget.isVertical ? 2.h : 50.h,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
