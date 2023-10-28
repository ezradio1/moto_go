import 'package:moto_go/models/motorcycle.dart';

const Map<String, String> merkList = {
  'YAMAHA': 'Yamaha',
  'HONDA': 'Honda',
  'DUCATI': 'Ducati',
  'VESPA': 'Vespa',
  'KAWASAKI': 'Kawasaki',
};

List<Motorcycle> motorcycleList = [
  Motorcycle('Mio', merkList['YAMAHA']!, 'images/motorcycle/mio.png', 2020,
      55000, true, 'Lorem ipsum'),
  Motorcycle('Vario', merkList['HONDA']!, 'images/motorcycle/vario.png', 2023,
      55000, false, 'Lorem ipsum'),
  Motorcycle('ADV', merkList['HONDA']!, 'images/motorcycle/adv.png', 2020,
      65000, false, 'Lorem ipsum'),
  Motorcycle('PCX', merkList['HONDA']!, 'images/motorcycle/pcx.png', 2020,
      65000, true, 'Lorem ipsum'),
  Motorcycle('N-MAX', merkList['YAMAHA']!, 'images/motorcycle/nmax.png', 2020,
      65000, true, 'Lorem ipsum'),
  Motorcycle('Areox', merkList['YAMAHA']!, 'images/motorcycle/aerox.png', 2022,
      60000, true, 'Lorem ipsum'),
  Motorcycle('Panigale', merkList['DUCATI']!, 'images/motorcycle/ducati.png',
      2018, 550000, true, 'Lorem ipsum'),
  Motorcycle('Filano', merkList['YAMAHA']!, 'images/motorcycle/filano.png',
      2022, 50000, true, 'Lorem ipsum'),
  Motorcycle('Fazio', merkList['YAMAHA']!, 'images/motorcycle/fazio.png', 2022,
      30000, true, 'Lorem ipsum'),
  Motorcycle('Fino', merkList['YAMAHA']!, 'images/motorcycle/fino.png', 2021,
      35000, false, 'Lorem ipsum'),
  Motorcycle('Mio', merkList['YAMAHA']!, 'images/motorcycle/mio.png', 2019,
      35000, true, 'Lorem ipsum'),
  Motorcycle('R1', merkList['YAMAHA']!, 'images/motorcycle/r1.png', 2016, 45000,
      true, 'Lorem ipsum'),
  Motorcycle('R25', merkList['YAMAHA']!, 'images/motorcycle/r25.png', 2020,
      320000, true, 'Lorem ipsum'),
  Motorcycle('Scoppy', merkList['HONDA']!, 'images/motorcycle/scoppy.png', 2020,
      40000, true, 'Lorem ipsum'),
  Motorcycle('Vespa', merkList['VESPA']!, 'images/motorcycle/vespa.png', 2020,
      125000, true, 'Lorem ipsum'),
  Motorcycle('Vixion', merkList['YAMAHA']!, 'images/motorcycle/vixion.png',
      2020, 9000, false, 'Lorem ipsum'),
  Motorcycle('X-MAX', merkList['YAMAHA']!, 'images/motorcycle/xmax.png', 2020,
      18000, true, 'Lorem ipsum'),
  Motorcycle('ZX-25', merkList['KAWASAKI']!, 'images/motorcycle/zx25.png', 2022,
      22000, true, 'Lorem ipsum'),
];