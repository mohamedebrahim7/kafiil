class ServiceResponse {
  final int status;
  final bool success;
  final List<Service> data;

  ServiceResponse({
    required this.status,
    required this.success,
    required this.data,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Service> servicesList = list.map((i) => Service.fromJson(i)).toList();

    return ServiceResponse(
      status: json['status'],
      success: json['success'],
      data: servicesList,
    );
  }
}

class Service {
  final int id;
  final String mainImage;
  final int price;
  final int? discount;
  final int priceAfterDiscount;
  final String title;
  final int averageRating;
  final int completedSalesCount;
  final bool recommended;

  Service({
    required this.id,
    required this.mainImage,
    required this.price,
    this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      mainImage: json['main_image'],
      price: json['price'],
      discount: json['discount'],
      priceAfterDiscount: json['price_after_discount'],
      title: json['title'],
      averageRating: json['average_rating'],
      completedSalesCount: json['completed_sales_count'],
      recommended: json['recommended'],
    );
  }
}
