class Restaurant {
  final String id;
  final String name;
  final String url;
  final String currency;
  final String thumbUrl;
  final String imageUrl;
  final String cuisines;
  final String address;
  final Rating rating;

  final int priceRange;



  Restaurant.fromJson(json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        thumbUrl = json['thumb'],
        imageUrl = json['featured_image'],
        priceRange = json['price_range'],
        currency = json['currency'],
        cuisines = json['cuisines'],
        address = json['location']['address'],
        rating = Rating.fromJson(json['user_rating']);//textRating= json['user_rating']['rating_text'].toString



}

class Rating {
  final String text;
  final String average;

  Rating.fromJson(Map json)
      : text = json['rating_text'].toString(),
        average = json['aggregate_rating'].toString();
}
