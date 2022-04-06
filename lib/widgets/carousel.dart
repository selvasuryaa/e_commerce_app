import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          items: [
            Container(
              alignment: Alignment.topCenter,
              width: 500,
              height: 700,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/download.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 500,
              height: 500,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/watches.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 500,
              height: 500,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/mobiles.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ],
    );
  }
}
