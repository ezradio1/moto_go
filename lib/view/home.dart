import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/constants/motorcycle_list.dart';
import 'package:moto_go/models/banner_ads.dart';
import 'package:moto_go/models/motorcycle.dart';
import 'package:moto_go/utils/screen.dart';
import 'package:moto_go/widget/input_custom.dart';
import 'package:moto_go/widget/motorcycle_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void handleTopUp() {}

  @override
  Widget build(BuildContext context) {
    double maxWidthScreen = getMaxWidth(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: ColorConstants.primary,
          elevation: 0,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            color: ColorConstants.primary,
            child: const Column(
              children: [
                HeaderBar(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.4,
                  ),
                ),
                MotoPay(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxWidthScreen),
                  child: const Column(
                    children: [
                      BannerAdsCarousel(),
                      SearchInput(),
                      MotorcycleList()
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hi, Jack',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        Row(
          children: [
            const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.person_4,
                  color: ColorConstants.primary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class MotoPay extends StatelessWidget {
  const MotoPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, // Warna kotak
        borderRadius: BorderRadius.circular(8), // Mengatur sudut menjadi bulat
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MotoPay',
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    'Rp 2.455.000',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.primary,
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class BannerAdsCarousel extends StatelessWidget {
  const BannerAdsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobileScreen = isMobile(context);
    final List<BannerAds> bannerList = [
      BannerAds('images/banner-1.jpeg', 'Discover New Adventures with MotoGo!'),
      BannerAds('images/banner-2.jpeg',
          'Hassle-Free Motorbike Rentals, Only on MotoGo!'),
      BannerAds('images/banner-3.jpeg',
          'Experience the Freedom of Riding with MotoGo!'),
      BannerAds(
          'images/banner-4.jpeg', 'Unleash Your Inner Explorer with MotoGo!'),
    ];

    final List<Widget> imageSliders = bannerList
        .map((item) => Container(
              margin: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        width: isMobileScreen ? 800 : double.infinity,
                        alignment: Alignment.center,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: isMobileScreen ? 2.0 : 3.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  void handleClickSearchButton() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: handleClickSearchButton,
          child: const InputCustom(
            labelText: 'Search',
            icon: Icons.search,
          ),
        ));
  }
}

class MotorcycleList extends StatelessWidget {
  const MotorcycleList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Motorcycle> fiveMotorcycleList = motorcycleList.sublist(0, 7);
    void handleClickViewAll() {}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Our Collection',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: handleClickViewAll,
                child: const Text(
                  'View All',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 220,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: fiveMotorcycleList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      MotorcycleCard(
                          brand: fiveMotorcycleList[index].brand,
                          merk: fiveMotorcycleList[index].merk,
                          image: fiveMotorcycleList[index].image,
                          price: fiveMotorcycleList[index].price,
                          isAvailable: fiveMotorcycleList[index].isAvailable,
                          year: fiveMotorcycleList[index].year),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
