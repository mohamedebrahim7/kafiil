class DependenciesResponse {
  final int status;
  final bool success;
  final DependenciesData data;

  DependenciesResponse({
    required this.status,
    required this.success,
    required this.data,
  });

  factory DependenciesResponse.fromJson(Map<String, dynamic> json) {
    return DependenciesResponse(
      status: json['status'],
      success: json['success'],
      data: DependenciesData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'data': data.toJson(),
    };
  }
}

class DependenciesData {
  final List<DependencyType> types;
  final List<DependencyTag> tags;
  final List<DependencySocialMedia> socialMedia;

  DependenciesData({
    required this.types,
    required this.tags,
    required this.socialMedia,
  });

  factory DependenciesData.fromJson(Map<String, dynamic> json) {
    return DependenciesData(
      types: (json['types'] as List)
          .map((i) => DependencyType.fromJson(i))
          .toList(),
      tags:
          (json['tags'] as List).map((i) => DependencyTag.fromJson(i)).toList(),
      socialMedia: (json['social_media'] as List)
          .map((i) => DependencySocialMedia.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'types': types.map((e) => e.toJson()).toList(),
      'tags': tags.map((e) => e.toJson()).toList(),
      'social_media': socialMedia.map((e) => e.toJson()).toList(),
    };
  }
}

class DependencyType {
  final int value;
  final String label;

  DependencyType({required this.value, required this.label});

  factory DependencyType.fromJson(Map<String, dynamic> json) {
    return DependencyType(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }
}

class DependencyTag {
  final int value;
  final String label;

  DependencyTag({required this.value, required this.label});

  factory DependencyTag.fromJson(Map<String, dynamic> json) {
    return DependencyTag(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }
}

class DependencySocialMedia {
  final String value;
  final String label;

  DependencySocialMedia({required this.value, required this.label});

  factory DependencySocialMedia.fromJson(Map<String, dynamic> json) {
    return DependencySocialMedia(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }
}
