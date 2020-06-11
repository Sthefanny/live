import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<Widget> cardList;

  const CarouselWithIndicator({Key key, @required this.cardList}) : super(key: key);

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState(cardList: cardList);
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  final List<Widget> cardList;

  int _current = 0;

  _CarouselWithIndicatorState({@required this.cardList});

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: cardList,
          enableInfiniteScroll: false,
          autoPlay: false,
          enlargeCenterPage: false,
          aspectRatio: 1.0,
          viewportFraction: 1.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            cardList,
            (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(shape: BoxShape.circle, color: _current == index ? Colors.white : Colors.white.withOpacity(0.2)),
              );
            },
          ),
        ),
      ],
    );
  }
}
