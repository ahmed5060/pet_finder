class AnimalsModel {
  AnimalsModel({
      this.animals, 
      this.pagination,});

  AnimalsModel.fromJson(dynamic json) {
    if (json['animals'] != null) {
      animals = [];
      json['animals'].forEach((v) {
        animals?.add(Animals.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<Animals>? animals;
  Pagination? pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (animals != null) {
      map['animals'] = animals?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    return map;
  }

}

class Pagination {
  Pagination({
      this.countPerPage, 
      this.totalCount, 
      this.currentPage, 
      this.totalPages, 
      this.links,});

  Pagination.fromJson(dynamic json) {
    countPerPage = json['count_per_page'];
    totalCount = json['total_count'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? countPerPage;
  int? totalCount;
  int? currentPage;
  int? totalPages;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count_per_page'] = countPerPage;
    map['total_count'] = totalCount;
    map['current_page'] = currentPage;
    map['total_pages'] = totalPages;
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }

}

class Animals {
  Animals({
      this.id, 
      this.organizationId, 
      this.url, 
      this.type, 
      this.species, 
      this.breeds, 
      this.colors,
      this.age, 
      this.gender, 
      this.size, 
      this.coat, 
      this.attributes, 
      this.environment, 
      this.name,
      this.description, 
      this.organizationAnimalId, 
      this.photos, 
      this.primaryPhotoCropped, 
      this.status,
      this.statusChangedAt, 
      this.publishedAt, 
      this.distance, 
      this.contact, 
      this.links,});

  Animals.fromJson(dynamic json) {
    id = json['id'];
    organizationId = json['organization_id'];
    url = json['url'];
    type = json['type'];
    species = json['species'];
    breeds = json['breeds'] != null ? Breeds.fromJson(json['breeds']) : null;
    colors = json['colors'] != null ? ColorsList.fromJson(json['colors']) : null;
    age = json['age'];
    gender = json['gender'];
    size = json['size'];
    coat = json['coat'];
    attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
    environment = json['environment'] != null ? Environment.fromJson(json['environment']) : null;
    name = json['name'];
    description = json['description'];
    organizationAnimalId = json['organization_animal_id'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    primaryPhotoCropped = json['primary_photo_cropped'] != null ? PrimaryPhotoCropped.fromJson(json['primary_photo_cropped']) : null;
    status = json['status'];
    statusChangedAt = json['status_changed_at'];
    publishedAt = json['published_at'];
    distance = json['distance'];
    contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? id;
  String? organizationId;
  String? url;
  String? type;
  String? species;
  Breeds? breeds;
  ColorsList? colors;
  String? age;
  String? gender;
  String? size;
  String? coat;
  Attributes? attributes;
  Environment? environment;
  String? name;
  String? description;
  dynamic organizationAnimalId;
  List<Photos>? photos;
  PrimaryPhotoCropped? primaryPhotoCropped;
  String? status;
  String? statusChangedAt;
  String? publishedAt;
  dynamic distance;
  Contact? contact;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['organization_id'] = organizationId;
    map['url'] = url;
    map['type'] = type;
    map['species'] = species;
    if (breeds != null) {
      map['breeds'] = breeds?.toJson();
    }
    if (colors != null) {
      map['colors'] = colors?.toJson();
    }
    map['age'] = age;
    map['gender'] = gender;
    map['size'] = size;
    map['coat'] = coat;
    if (attributes != null) {
      map['attributes'] = attributes?.toJson();
    }
    if (environment != null) {
      map['environment'] = environment?.toJson();
    }
    map['name'] = name;
    map['description'] = description;
    map['organization_animal_id'] = organizationAnimalId;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    if (primaryPhotoCropped != null) {
      map['primary_photo_cropped'] = primaryPhotoCropped?.toJson();
    }
    map['status'] = status;
    map['status_changed_at'] = statusChangedAt;
    map['published_at'] = publishedAt;
    map['distance'] = distance;
    if (contact != null) {
      map['contact'] = contact?.toJson();
    }
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }

}

class Links {
  Links({
      this.self, 
      this.type, 
      this.organization,});

  Links.fromJson(dynamic json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
  }
  Self? self;
  Type? type;
  Organization? organization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.toJson();
    }
    if (type != null) {
      map['type'] = type?.toJson();
    }
    if (organization != null) {
      map['organization'] = organization?.toJson();
    }
    return map;
  }

}

class Organization {
  Organization({
      this.href,});

  Organization.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Type {
  Type({
      this.href,});

  Type.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Self {
  Self({
      this.href,});

  Self.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Contact {
  Contact({
      this.email, 
      this.phone, 
      this.address,});

  Contact.fromJson(dynamic json) {
    email = json['email'];
    phone = json['phone'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }
  String? email;
  String? phone;
  Address? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phone'] = phone;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }

}

class Address {
  Address({
      this.address1, 
      this.address2, 
      this.city, 
      this.state, 
      this.postcode, 
      this.country,});

  Address.fromJson(dynamic json) {
    address1 = json['address1']?? "NA";
    address2 = json['address2']?? "NA";
    city = json['city']?? "NA";
    state = json['state']?? "NA";
    postcode = json['postcode']?? "NA";
    country = json['country']?? "NA";
  }
  dynamic address1;
  dynamic address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address1'] = address1;
    map['address2'] = address2;
    map['city'] = city;
    map['state'] = state;
    map['postcode'] = postcode;
    map['country'] = country;
    return map;
  }

}

class PrimaryPhotoCropped {
  PrimaryPhotoCropped({
      this.small, 
      this.medium, 
      this.large, 
      this.full,});

  PrimaryPhotoCropped.fromJson(dynamic json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    full = json['full'];
  }
  String? small;
  String? medium;
  String? large;
  String? full;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['small'] = small;
    map['medium'] = medium;
    map['large'] = large;
    map['full'] = full;
    return map;
  }

}

class Photos {
  Photos({
      this.small, 
      this.medium, 
      this.large, 
      this.full,});

  Photos.fromJson(dynamic json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    full = json['full'];
  }
  String? small;
  String? medium;
  String? large;
  String? full;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['small'] = small;
    map['medium'] = medium;
    map['large'] = large;
    map['full'] = full;
    return map;
  }

}

class Environment {
  Environment({
      this.children, 
      this.dogs, 
      this.cats,});

  Environment.fromJson(dynamic json) {
    children = json['children'];
    dogs = json['dogs'];
    cats = json['cats'];
  }
  dynamic children;
  dynamic dogs;
  dynamic cats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['children'] = children;
    map['dogs'] = dogs;
    map['cats'] = cats;
    return map;
  }

}

class Attributes {
  Attributes({
      this.spayedNeutered, 
      this.houseTrained, 
      this.declawed, 
      this.specialNeeds, 
      this.shotsCurrent,});

  Attributes.fromJson(dynamic json) {
    spayedNeutered = json['spayed_neutered'];
    houseTrained = json['house_trained'];
    declawed = json['declawed'];
    specialNeeds = json['special_needs'];
    shotsCurrent = json['shots_current'];
  }
  bool? spayedNeutered;
  bool? houseTrained;
  dynamic declawed;
  bool? specialNeeds;
  bool? shotsCurrent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spayed_neutered'] = spayedNeutered;
    map['house_trained'] = houseTrained;
    map['declawed'] = declawed;
    map['special_needs'] = specialNeeds;
    map['shots_current'] = shotsCurrent;
    return map;
  }

}

class ColorsList {
  ColorsList({
      this.primary, 
      this.secondary, 
      this.tertiary,});

  ColorsList.fromJson(dynamic json) {
    primary = json['primary'];
    secondary = json['secondary'];
    tertiary = json['tertiary'];
  }
  String? primary;
  dynamic secondary;
  dynamic tertiary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['primary'] = primary;
    map['secondary'] = secondary;
    map['tertiary'] = tertiary;
    return map;
  }

}

class Breeds {
  Breeds({
      this.primary, 
      this.secondary, 
      this.mixed, 
      this.unknown,});

  Breeds.fromJson(dynamic json) {
    primary = json['primary'];
    secondary = json['secondary'];
    mixed = json['mixed'];
    unknown = json['unknown'];
  }
  String? primary;
  dynamic secondary;
  bool? mixed;
  bool? unknown;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['primary'] = primary;
    map['secondary'] = secondary;
    map['mixed'] = mixed;
    map['unknown'] = unknown;
    return map;
  }

}