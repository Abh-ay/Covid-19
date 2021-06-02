class Info {
  List<Data> data;
  String dt;
  int ts;

  Info({this.data, this.dt, this.ts});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    dt = json['dt'];
    ts = json['ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['dt'] = this.dt;
    data['ts'] = this.ts;
    return data;
  }
}

class Data {
  String location;
  int confirmed;
  int deaths;
  int recovered;
  int active;

  Data(
      {this.location,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active});

  Data.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    return data;
  }
}
