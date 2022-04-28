class Beverage {
  String imageUrl;
  String city;
  String country;
  String description;
  late String url;

  Beverage({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.url,
  });
}

List<Beverage> product = [
  Beverage(
      imageUrl: 'assets/images/almond.jpg',
      city: 'Almond Trees',
      country: ' dry summers and mild',
      description:
          'Coming in at the second most popular nut globally, its no surprise that many people are starting to grow their own almond Prunus dolcis trees.',
      url:
          'https://firebasestorage.googleapis.com/v0/b/krishi-a839f.appspot.com/o/pdfs%2FAlmond%20Trees%20fruit.pdf?alt=media&token=1e0a1e95-4224-457e-b36e-8cc924acfc01'),
  Beverage(
    imageUrl: 'assets/images/basil.jpg',
    city: 'Basil Cultivation',
    country: 'Indoor/ Outdoor',
    description:
        'If ever an herb said summer, its basil. Ocimum basilicum is a member of the mint family and is native to India. It is an easy herb to grow for beginners and old-timers alike.',
    url:
        'https://firebasestorage.googleapis.com/v0/b/krishi-a839f.appspot.com/o/pdfs%2FBasil.pdf?alt=media&token=4f47224d-1a81-433d-b2c5-c484ce505e8b',
  ),
  Beverage(
    imageUrl: 'assets/images/cucumbers.jpg',
    city: 'Cucumbers Faming',
    country: 'water coral reefs',
    description:
        'There is nothing quite as tasty as the crisp and crunchy freshness of homegrown cucumbers Cucumis sativus.',
    url:
        'https://firebasestorage.googleapis.com/v0/b/krishi-a839f.appspot.com/o/pdfs%2FCucumbers.pdf?alt=media&token=554bb9dc-2eb3-4bb1-a7f3-edad4fb35ee2',
  ),
  Beverage(
    imageUrl: 'assets/images/potatoes.jpg',
    city: 'Potatoes Farming',
    country: 'cool / warm wet tropical climates',
    description:
        'Potatoes are a popular crop in home gardens, for a good reason. Unfortunately, many home gardeners inadvertently fail to fertilize their plants enough and do not see maximum yields.',
    url:
        'https://firebasestorage.googleapis.com/v0/b/krishi-a839f.appspot.com/o/pdfs%2FPotatoes.pdf?alt=media&token=f4f41576-fe83-4e0a-b398-cba71606d04e',
  ),
  Beverage(
    imageUrl: 'assets/images/Watermelon.jpg',
    city: 'Watermelon Farming',
    country: ' Dry Soil',
    description:
        'Watermelons are one of the most popular fruits to plant, and they have beenn cultivated and enjoyed by gardeners around the world.',
    url:
        'https://firebasestorage.googleapis.com/v0/b/krishi-a839f.appspot.com/o/pdfs%2FWatermelon.pdf?alt=media&token=beba01bd-0289-4075-abbd-fb87bcdd1edf',
  ),
];