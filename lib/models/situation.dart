import 'package:flutter/cupertino.dart';

class Situation {
  final String updateDateTime;
  final int localNewCases;
  final int localTotalCases;
  final int localTotalNumberOfIndividualsInHospitals;
  final int localDeaths;
  final int localRecovered;
  final int globalNewCases;
  final int globalTotalCases;
  final int globalDeaths;
  final int globalRecovers;
  final List hospitalData;

  Situation({
    this.updateDateTime,
    this.localNewCases,
    this.localTotalCases,
    this.localTotalNumberOfIndividualsInHospitals,
    this.localDeaths,
    this.localRecovered,
    this.globalNewCases,
    this.globalTotalCases,
    this.globalDeaths,
    this.globalRecovers,
    this.hospitalData,
  });

  Situation.fromJson(Map<String, dynamic> parsedJson)
      : updateDateTime = parsedJson['update_date_time'],
        localNewCases = parsedJson['local_new_cases'],
        localTotalCases = parsedJson['local_total_cases'],
        localTotalNumberOfIndividualsInHospitals =
            parsedJson['local_total_number_of_individuals_in_hospitals'],
        localDeaths = parsedJson['local_deaths'],
        localRecovered = parsedJson['local_recovered'],
        globalNewCases = parsedJson['global_new_cases'],
        globalTotalCases = parsedJson['global_total_cases'],
        globalDeaths = parsedJson['global_deaths'],
        globalRecovers = parsedJson['global_recovered'],
        hospitalData = parsedJson['hospital_data'];
}
