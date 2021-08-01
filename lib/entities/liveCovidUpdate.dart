class LiveCovidUpdate {
  final String totalCases;
  final String totalDeaths;
  final String activeCases;
  final String totalRecovered;
  final String lastUpdateDate;
  final String countryName;

  LiveCovidUpdate({
    required this.totalCases,
    required this.totalDeaths,
    required this.activeCases,
    required this.totalRecovered,
    required this.lastUpdateDate,
    required this.countryName,
  });

  factory LiveCovidUpdate.fromJson(Map<String, dynamic> json) {
    return LiveCovidUpdate(
      totalCases: json['Total Cases_text'],
      totalDeaths: json['Total Deaths_text'],
      activeCases: json['Active Cases_text'],
      totalRecovered: json['Total Recovered_text'],
      lastUpdateDate: json['Last Update'].split(" ")[0],
      countryName: json['Country_text'],
    );
  }
}
