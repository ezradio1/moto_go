import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/constants/motorcycle_list.dart';
import 'package:moto_go/models/motorcycle.dart';
import 'package:moto_go/utils/screen.dart';
import 'package:moto_go/widget/custom_container.dart';
import 'package:moto_go/widget/input_custom.dart';
import 'package:moto_go/widget/motorcycle_card.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  String searchValue = '';
  List<String> activeFilter = [];

  void handleChangeSearch(String value) {
    setState(() {
      searchValue = value;
    });
  }

  void handleClickFilter(value) {
    setState(() {
      activeFilter.contains(value)
          ? activeFilter.remove(value)
          : activeFilter.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobileScreen = isMobile(context);
    List<Motorcycle> collectionList =
        searchValue != '' && activeFilter.isNotEmpty
            ? motorcycleList
                .where((element) => '${element.brand} ${element.merk}'
                    .toLowerCase()
                    .contains(searchValue.toLowerCase()))
                .where((element) => activeFilter.contains(element.brand))
                .toList()
            : activeFilter.isNotEmpty
                ? motorcycleList
                    .where((element) => activeFilter.contains(element.brand))
                    .toList()
                : searchValue != ''
                    ? motorcycleList
                        .where((element) => '${element.brand} ${element.merk}'
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()))
                        .toList()
                    : motorcycleList;

    return Center(
        child: CustomContainer(
            child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: SafeArea(
                    child: Column(
                  children: [
                    SearchInput(onChangeSearch: handleChangeSearch),
                    BrandFilter(
                      activeFilter: activeFilter,
                      onClickFilter: handleClickFilter,
                    ),
                    collectionList.isEmpty
                        ? const EmptyState()
                        : Expanded(
                            child: GridView.count(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                crossAxisCount: isMobileScreen ? 2 : 5,
                                childAspectRatio: 0.85,
                                children: List.generate(
                                  collectionList.length,
                                  (index) => MotorcycleCard(
                                      brand: collectionList[index].brand,
                                      merk: collectionList[index].merk,
                                      image: collectionList[index].image,
                                      price: collectionList[index].price,
                                      isAvailable:
                                          collectionList[index].isAvailable,
                                      year: collectionList[index].year),
                                ))),
                  ],
                )))));
  }
}

class SearchInput extends StatelessWidget {
  final Function(String value) onChangeSearch;
  const SearchInput({super.key, required this.onChangeSearch});

  @override
  Widget build(BuildContext context) {
    return InputCustom(
      onChanged: (value) {
        onChangeSearch(value);
      },
      labelText: 'Search our collection',
      icon: Icons.search,
    );
  }
}

class BrandFilter extends StatelessWidget {
  final List<String> activeFilter;
  final Function(String value) onClickFilter;
  const BrandFilter(
      {super.key, required this.activeFilter, required this.onClickFilter});

  @override
  Widget build(BuildContext context) {
    List<String> filterList = [
      'Yamaha',
      'Honda',
      'Kawasaki',
      'Vespa',
      'Ducati',
    ];
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      height: 32,
      child: Expanded(
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 8), // Add a gap of 10 pixels
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      onClickFilter(filterList[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: activeFilter.contains(filterList[index])
                              ? ColorConstants.primary
                              : Colors.white,
                          border: Border.all(
                              color: activeFilter.contains(filterList[index])
                                  ? ColorConstants.primary
                                  : Colors.grey)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Text(
                        filterList[index],
                        style: TextStyle(
                            fontWeight: activeFilter.contains(filterList[index])
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: activeFilter.contains(filterList[index])
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ))),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/empty_illustration.png',
          width: isMobile(context) ? double.infinity : 400,
        ),
        const Text(
          'Motorbike not found',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          'The motorbike you are looking for does not exist :(. Please look for another motorbike.',
          textAlign: TextAlign.center,
        )
      ],
    ));
  }
}
