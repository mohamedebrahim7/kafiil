class CountryResponse {
  final int status;
  final bool success;
  final List<Country> data;
  final Pagination pagination;

  CountryResponse({
    required this.status,
    required this.success,
    required this.data,
    required this.pagination,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    return CountryResponse(
      status: json['status'],
      success: json['success'],
      data: (json['data'] as List)
          .map((country) => Country.fromJson(country))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'data': data.map((country) => country.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}

class Country {
  final int id;
  final String countryCode;
  final String name;
  final String capital;

  Country({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      countryCode: json['country_code'],
      name: json['name'],
      capital: json['capital'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_code': countryCode,
      'name': name,
      'capital': capital,
    };
  }
}

class Pagination {
  final int count;
  final int total;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final Links links;

  Pagination({
    required this.count,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      count: json['count'],
      total: json['total'],
      perPage: json['perPage'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      links: Links.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'total': total,
      'perPage': perPage,
      'currentPage': currentPage,
      'totalPages': totalPages,
      'links': links.toJson(),
    };
  }
}

class Links {
  final String? next;

  Links({
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'next': next,
    };
  }
}
