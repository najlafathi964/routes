import 'package:carousel_slider/carousel_slider.dart';
import 'package:routes/widgets/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routes/model/hotel_model.dart';

class HotelDetailsPage extends StatefulWidget {
  HotelModel? hotelModel ;
  HotelDetailsPage({Key? key ,this.hotelModel });
  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState(hotelModel);
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  HotelModel? hotelModel ;
  _HotelDetailsPageState(this.hotelModel);

  CarouselController carouselController = CarouselController();

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 350.h,
              width: double.maxFinite,
              child: Stack(alignment: Alignment.topLeft, children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      items:  [

                        ClipRRect(
                          child: Image(
                             image: AssetImage(
                               'assets/images/valeriia-bugaiova.png'),
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),

                        ) ,
                        ClipRRect(
                          child: Image(
                            image: AssetImage('${hotelModel?.image}'),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ) ,
                        ClipRRect(
                          child: Image(
                            image: AssetImage(
                                'assets/images/bed-bedroom.png'),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                        )
                      ],
                      options: CarouselOptions(
                          initialPage: 0,
                          height: 350.h,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                            autoPlay: true,
                               autoPlayInterval: const Duration(seconds: 3) ,
                              autoPlayAnimationDuration: const Duration(seconds: 1) ,
                              autoPlayCurve: Curves.fastOutSlowIn ,
                          scrollDirection: Axis.horizontal,
                          // onScrolled: (index) => setState(() {
                          //       currentIndex = (index! - 10000.0).toInt();
                          //     }),
                          onPageChanged: (index, reason) =>
                              setState(() => currentIndex = index)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      child: DotsIndicator(
                          dotsCount: 3,
                          position: currentIndex.toDouble(),
                          decorator: DotsDecorator(
                              activeColor: Colors.white,
                              size: const Size.square(9),
                              activeSize: const Size(18, 9),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                    ),
                  ],
                ),
                Positioned(
                  top: 60.h,
                  left: 20.w,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context ,hotelModel!.isFav);
                    },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                )
              ])),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bigText(text: '${hotelModel?.name}', size: 20),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    smallText(
                        text: '${hotelModel?.location}',
                        size: 14,
                        color: Colors.black),
                    const Text('-'),
                    smallText(
                        text: '  Show in map', color: Colors.grey, size: 14)
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                smallText(
                    text:
                    '${hotelModel?.info}'
,                    color: const Color(0xff8492A7),
                    size: 12),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        smallText(
                            text: 'Price', color: Color(0xff8492A7), size: 14),
                        SizedBox(
                          height: 5.h,
                        ),
                        smallText(text: '${hotelModel?.price}', size: 14, color: Colors.black),
                      ],
                    ),
                    Column(
                      children: [
                        smallText(
                            text: 'Reviews',
                            color: const Color(0xff8492A7),
                            size: 14),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            smallText(
                                text: '4.5', size: 14, color: Colors.indigo),
                            Wrap(
                              children: List.generate(4, (index) {
                                if (index == 3) {
                                  return const Icon(
                                    Icons.star_half,
                                    color: Colors.indigo,
                                    size: 14,
                                  );
                                }
                                return const Icon(
                                  Icons.star,
                                  color: Colors.indigo,
                                  size: 14,
                                );
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        smallText(
                            text: 'Recently booked',
                            color: const Color(0xff8492A7),
                            size: 14),
                        SizedBox(
                          height: 5.h,
                        ),
                        Wrap(
                          spacing: -8,
                          children: List.generate(4, (index) {
                            if (index == 3) {
                              return CircleAvatar(
                                  backgroundColor: Colors.indigo,
                                  radius: 10,
                                  child: smallText(
                                    text: '+5',
                                    size: 14,
                                  ));
                            }
                            return CircleAvatar(
                                radius: 10.r,
                                backgroundImage:
                                    const AssetImage('assets/images/user_image.png'));
                          }),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                bigText(text: 'Aminities'),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailsIcon(
                        image: 'assets/images/sports-car.svg', text: 'Parking'),
                    SizedBox(
                      width: 10.w,
                    ),
                    DetailsIcon(image: 'assets/images/bath.svg', text: 'Bath'),
                    SizedBox(
                      width: 10.w,
                    ),
                    DetailsIcon(
                        image: 'assets/images/glass-and-bottle.svg',
                        text: 'Bar'),
                    SizedBox(
                      width: 10.w,
                    ),
                    DetailsIcon(image: 'assets/images/wifi.svg', text: 'Wifi'),
                    SizedBox(
                      width: 10.w,
                    ),
                    DetailsIcon(image: 'assets/images/gym.svg', text: 'Gym'),
                    SizedBox(
                      width: 10.w,
                    ),
                    DetailsIcon(image: 'assets/images/more.svg', text: 'More'),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          hotelModel!.isFav = !hotelModel!.isFav ;
                        });
                      },
                      child: Material(
                        shadowColor: const Color(0x00707070),
                        borderRadius: BorderRadius.circular(10.r),
                        elevation: 5,
                        child: SizedBox(
                            width: 55.w,
                            height: 55.h,
                            child:  Center(
                                child: Icon(
                              hotelModel!.isFav ?Icons.favorite : Icons.favorite_border,
                              size: 24,
                              color: Colors.indigo,
                            ))),
                      ),
                    ),
                    Spacer(),
                    Material(
                      shadowColor: const Color(0x00707070),
                      borderRadius: BorderRadius.circular(10.r),
                      elevation: 5,
                      child: Container(
                          height: 55.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                              color:hotelModel!.isBooked? Theme.of(context).disabledColor : Colors.indigo,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: const Center(
                              child: Text(
                            'Book now',
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget DetailsIcon({required String image, required String text}) {
    return Column(
      children: [
        Material(
          shadowColor: const Color(0x00707070),
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: SizedBox(
            width: 30.w,
            height: 30.h,
            child: SvgPicture.asset(
              image,
              fit: BoxFit.none,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        smallText(text: text, color: const Color(0xff8492A7))
      ],
    );
  }

  Widget AppIcon(
          {required IconData icon,
          double size = 40,
          double iconSize = 16,
          Color backgroundColor = const Color(0xFFfcf4e4),
          Color iconColor = const Color(0xFF756d54)}) =>
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            color: backgroundColor),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      );
}
