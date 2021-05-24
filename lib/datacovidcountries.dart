import 'dart:convert';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);


Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.undefined,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  int updated;
  String country;
  CountryInfo countryInfo;
  double cases;
  int todayCases;
  double deaths;
  int todayDeaths;
  double recovered;
  int todayRecovered;
  double active;
  double critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  double tests;
  double testsPerOneMillion;
  double population;
  String continent;
  double oneCasePerPeople;
  double oneDeathPerPeople;
  double oneTestPerPeople;
  double undefined;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    updated: json["updated"],
    country: json["country"],
    countryInfo: CountryInfo.fromJson(json["countryInfo"]),
    cases: json["cases"],
    todayCases: json["todayCases"],
    deaths: json["deaths"],
    todayDeaths: json["todayDeaths"],
    recovered: json["recovered"],
    todayRecovered: json["todayRecovered"],
    active: json["active"],
    critical: json["critical"],
    casesPerOneMillion: json["casesPerOneMillion"],
    deathsPerOneMillion: json["deathsPerOneMillion"],
    tests: json["tests"],
    testsPerOneMillion: json["testsPerOneMillion"],
    population: json["population"],
    continent: json["continent"],
    oneCasePerPeople: json["oneCasePerPeople"],
    oneDeathPerPeople: json["oneDeathPerPeople"],
    oneTestPerPeople: json["oneTestPerPeople"],
    undefined: json["undefined"],
    activePerOneMillion: json["activePerOneMillion"].toDouble(),
    recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
    criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "country": country,
    "countryInfo": countryInfo.toJson(),
    "cases": cases,
    "todayCases": todayCases,
    "deaths": deaths,
    "todayDeaths": todayDeaths,
    "recovered": recovered,
    "todayRecovered": todayRecovered,
    "active": active,
    "critical": critical,
    "casesPerOneMillion": casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion,
    "tests": tests,
    "testsPerOneMillion": testsPerOneMillion,
    "population": population,
    "continent": continent,
    "oneCasePerPeople": oneCasePerPeople,
    "oneDeathPerPeople": oneDeathPerPeople,
    "oneTestPerPeople": oneTestPerPeople,
    "undefined": undefined,
    "activePerOneMillion": activePerOneMillion,
    "recoveredPerOneMillion": recoveredPerOneMillion,
    "criticalPerOneMillion": criticalPerOneMillion,
  };
}

class CountryInfo {
  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  int id;
  String iso2;
  String iso3;
  int lat;
  int long;
  String flag;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
    id: json["_id"],
    iso2: json["iso2"],
    iso3: json["iso3"],
    lat: json["lat"],
    long: json["long"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "iso2": iso2,
    "iso3": iso3,
    "lat": lat,
    "long": long,
    "flag": flag,
  };
}

Future <Data>  fetchBoredActivity(String id) async {
  final response =
  await  http.get(Uri.https('api.caw.sh', 'v3/covid-19/countries/$id'));
  if (response.statusCode == 200){
    return Data.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Board Activity');
  }
}

Future <CountryInfo>  fetchBoredActivity2(String id) async {
  final response =
  await  http.get(Uri.https('api.caw.sh', 'v3/covid-19/countries/$id'));
  if (response.statusCode == 200){
    return CountryInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Board Activity');
  }
}