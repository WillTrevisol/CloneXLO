import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/ad.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/description_panel.dart';
import 'widgets/location_panel.dart';
import 'widgets/main_panel.dart';
import 'widgets/user_panel.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({required this.ad ,Key? key}) : super(key: key);

  final Ad ad;

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {

  final CarouselController carouselController = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Anúncio'),
      ),
      body: Stack(
        children: <Widget> [
          ListView(
            children: <Widget> [
              Stack(
                children: <Widget> [
                  Container(
                    color: Colors.grey[700],
                    child: CarouselSlider.builder(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.32,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.65,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlayCurve: Curves.decelerate,
                        onPageChanged: (index, reason) {
                          setState((){
                            activeIndex = index;
                          });
                        }
                      ),
                      itemCount: widget.ad.images.length,
                      itemBuilder: (context, index, realIndex) {
                        return _buildImage(widget.ad.images[index], index);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: _scrollIndicator(context),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    MainPanel(ad: widget.ad),
                    Divider(color: Colors.grey[500]),
                    DescriptionPanel(ad: widget.ad),
                    Divider(color: Colors.grey[500]),
                    LocationPanel(ad: widget.ad),
                    Divider(color: Colors.grey[500]),
                    UserPanel(ad: widget.ad),
                    const SizedBox(height: 120),
                  ],
                ), 
              )
            ],
          ),
          BottomBar(ad: widget.ad),
        ],
      ),
    );
  }

  Widget _scrollIndicator(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withAlpha(100),
      child: Center(
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex, 
          count: widget.ad.images.length,
          effect: const WormEffect(
            paintStyle: PaintingStyle.stroke,
            type: WormType.thin,
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: Colors.orange,
            dotColor: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String url, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: CachedNetworkImage(
        imageUrl: url,
      ),
    );
  }
}