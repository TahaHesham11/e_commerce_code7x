class CountryModel {
  bool? success;
  String? message;
  List<DataCountry>? data;

  CountryModel({this.success, this.message, this.data});

  CountryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataCountry>[];
      json['data'].forEach((v) {
        data!.add( DataCountry.fromJson(v));
      });
    }
  }

}

class DataCountry {
  int? id;
  String? iso;
  String? name;
  String? iso3;
  int? numcode;
  int? phonecode;
  List<Regions>? regions;
  DataCountry();

  DataCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iso = json['iso'];
    name = json['name'];
    iso3 = json['iso3'];
    numcode = json['numcode'];
    phonecode = json['phonecode'];
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add( Regions.fromJson(v));
      });
    }
  }

}

class Regions {
  int? id;
  String? name;
  List<Cities>? cities;


  Regions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add( Cities.fromJson(v));
      });
    }
  }

}

class Cities {
  int? id;
  String? name;
  List<Districts>? districts;


  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(new Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.districts != null) {
      data['districts'] = this.districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Districts {
  int? id;
  String? name;

  Districts({this.id, this.name});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
