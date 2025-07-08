class CategoryModel {
  final String? status;
  final String? copyright;
  final String? section;
  final String? lastUpdated;
  final int? numResults;
  final List<Results>? results;

  CategoryModel({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  CategoryModel copyWith({
    String? status,
    String? copyright,
    String? section,
    String? lastUpdated,
    int? numResults,
    List<Results>? results,
  }) {
    return CategoryModel(
      status: status ?? this.status,
      copyright: copyright ?? this.copyright,
      section: section ?? this.section,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      numResults: numResults ?? this.numResults,
      results: results ?? this.results,
    );
  }

  CategoryModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as String?,
      copyright = json['copyright'] as String?,
      section = json['section'] as String?,
      lastUpdated = json['last_updated'] as String?,
      numResults = json['num_results'] as int?,
      results = (json['results'] as List?)
          ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
          .toList();

  Map<String, dynamic> toJson() => {
    'status': status,
    'copyright': copyright,
    'section': section,
    'last_updated': lastUpdated,
    'num_results': numResults,
    'results': results?.map((e) => e.toJson()).toList(),
  };
}

class Results {
  final String? section;
  final String? subsection;
  final String? title;
  final String? abstract;
  final String? url;
  final String? uri;
  final String? byline;
  final String? itemType;
  final String? updatedDate;
  final String? createdDate;
  final String? publishedDate;
  final String? materialTypeFacet;
  final String? kicker;
  final List<String>? desFacet;
  final List<String>? orgFacet;
  final List<String>? perFacet;
  final List<dynamic>? geoFacet;
  final List<Multimedia>? multimedia;
  final String? shortUrl;

  Results({
    this.section,
    this.subsection,
    this.title,
    this.abstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  Results copyWith({
    String? section,
    String? subsection,
    String? title,
    String? abstract,
    String? url,
    String? uri,
    String? byline,
    String? itemType,
    String? updatedDate,
    String? createdDate,
    String? publishedDate,
    String? materialTypeFacet,
    String? kicker,
    List<String>? desFacet,
    List<String>? orgFacet,
    List<String>? perFacet,
    List<dynamic>? geoFacet,
    List<Multimedia>? multimedia,
    String? shortUrl,
  }) {
    return Results(
      section: section ?? this.section,
      subsection: subsection ?? this.subsection,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      url: url ?? this.url,
      uri: uri ?? this.uri,
      byline: byline ?? this.byline,
      itemType: itemType ?? this.itemType,
      updatedDate: updatedDate ?? this.updatedDate,
      createdDate: createdDate ?? this.createdDate,
      publishedDate: publishedDate ?? this.publishedDate,
      materialTypeFacet: materialTypeFacet ?? this.materialTypeFacet,
      kicker: kicker ?? this.kicker,
      desFacet: desFacet ?? this.desFacet,
      orgFacet: orgFacet ?? this.orgFacet,
      perFacet: perFacet ?? this.perFacet,
      geoFacet: geoFacet ?? this.geoFacet,
      multimedia: multimedia ?? this.multimedia,
      shortUrl: shortUrl ?? this.shortUrl,
    );
  }

  Results.fromJson(Map<String, dynamic> json)
    : section = json['section'] as String?,
      subsection = json['subsection'] as String?,
      title = json['title'] as String?,
      abstract = json['abstract'] as String?,
      url = json['url'] as String?,
      uri = json['uri'] as String?,
      byline = json['byline'] as String?,
      itemType = json['item_type'] as String?,
      updatedDate = json['updated_date'] as String?,
      createdDate = json['created_date'] as String?,
      publishedDate = json['published_date'] as String?,
      materialTypeFacet = json['material_type_facet'] as String?,
      kicker = json['kicker'] as String?,
      desFacet = (json['des_facet'] as List?)
          ?.map((dynamic e) => e as String)
          .toList(),
      orgFacet = (json['org_facet'] as List?)
          ?.map((dynamic e) => e as String)
          .toList(),
      perFacet = (json['per_facet'] as List?)
          ?.map((dynamic e) => e as String)
          .toList(),
      geoFacet = json['geo_facet'] as List?,
      multimedia = (json['multimedia'] as List?)
          ?.map((dynamic e) => Multimedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortUrl = json['short_url'] as String?;

  Map<String, dynamic> toJson() => {
    'section': section,
    'subsection': subsection,
    'title': title,
    'abstract': abstract,
    'url': url,
    'uri': uri,
    'byline': byline,
    'item_type': itemType,
    'updated_date': updatedDate,
    'created_date': createdDate,
    'published_date': publishedDate,
    'material_type_facet': materialTypeFacet,
    'kicker': kicker,
    'des_facet': desFacet,
    'org_facet': orgFacet,
    'per_facet': perFacet,
    'geo_facet': geoFacet,
    'multimedia': multimedia?.map((e) => e.toJson()).toList(),
    'short_url': shortUrl,
  };
}

class Multimedia {
  final String? url;
  final String? format;
  final int? height;
  final int? width;
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;

  Multimedia({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  Multimedia copyWith({
    String? url,
    String? format,
    int? height,
    int? width,
    String? type,
    String? subtype,
    String? caption,
    String? copyright,
  }) {
    return Multimedia(
      url: url ?? this.url,
      format: format ?? this.format,
      height: height ?? this.height,
      width: width ?? this.width,
      type: type ?? this.type,
      subtype: subtype ?? this.subtype,
      caption: caption ?? this.caption,
      copyright: copyright ?? this.copyright,
    );
  }

  Multimedia.fromJson(Map<String, dynamic> json)
    : url = json['url'] as String?,
      format = json['format'] as String?,
      height = json['height'] as int?,
      width = json['width'] as int?,
      type = json['type'] as String?,
      subtype = json['subtype'] as String?,
      caption = json['caption'] as String?,
      copyright = json['copyright'] as String?;

  Map<String, dynamic> toJson() => {
    'url': url,
    'format': format,
    'height': height,
    'width': width,
    'type': type,
    'subtype': subtype,
    'caption': caption,
    'copyright': copyright,
  };
}
