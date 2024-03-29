import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/slider_dot.dart';

class SliderWrapper extends StatefulWidget {
  const SliderWrapper({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<SliderWrapper> createState() => _SliderWrapperState();
}

class _SliderWrapperState extends State<SliderWrapper> {
  final sliderController = PageController(
    viewportFraction: 0.5,
    initialPage: 1,
  );

  int currentIndex = 1;

  void onPageChanged(int index) {
    if (index == 0) {
      sliderController.jumpToPage(widget.images.length - index);
    }
    currentIndex = index % widget.images.length;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: sliderController,
            onPageChanged: onPageChanged,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Image.network(
                  widget.images[i % widget.images.length],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i < widget.images.length + 1; i++)
              SliderDot(
                isSelected: currentIndex == 0 && i == widget.images.length
                    ? true
                    : currentIndex == i,
              ),
          ],
        ),
      ],
    );
  }
}
