// To parse this JSON data, do
//
//     final covidTodayResultWorldWide = covidTodayResultWorldWideFromJson(jsonString);

import 'dart:convert';

CovidTodayResultWorldWide covidTodayResultWorldWideFromJson(String str) => CovidTodayResultWorldWide.fromJson(json.decode(str));

String covidTodayResultWorldWideToJson(CovidTodayResultWorldWide data) => json.encode(data.toJson());

class CovidTodayResultWorldWide {
    CovidTodayResultWorldWide({
        this.date,
        this.states,
        this.positive,
        this.negative,
        this.pending,
        this.hospitalizedCurrently,
        this.hospitalizedCumulative,
        this.inIcuCurrently,
        this.inIcuCumulative,
        this.onVentilatorCurrently,
        this.onVentilatorCumulative,
        this.recovered,
        this.dateChecked,
        this.death,
        this.hospitalized,
        this.totalTestResults,
        this.lastModified,
        this.total,
        this.posNeg,
        this.deathIncrease,
        this.hospitalizedIncrease,
        this.negativeIncrease,
        this.positiveIncrease,
        this.totalTestResultsIncrease,
        this.hash,
    });

    int date;
    int states;
    int positive;
    int negative;
    int pending;
    int hospitalizedCurrently;
    int hospitalizedCumulative;
    int inIcuCurrently;
    int inIcuCumulative;
    int onVentilatorCurrently;
    int onVentilatorCumulative;
    int recovered;
    String dateChecked;
    int death;
    int hospitalized;
    int totalTestResults;
    String lastModified;
    int total;
    int posNeg;
    int deathIncrease;
    int hospitalizedIncrease;
    int negativeIncrease;
    int positiveIncrease;
    int totalTestResultsIncrease;
    String hash;

    factory CovidTodayResultWorldWide.fromJson(Map<String, dynamic> json) => CovidTodayResultWorldWide(
        date: json["date"] == null ? null : json["date"],
        states: json["states"] == null ? null : json["states"],
        positive: json["positive"] == null ? null : json["positive"],
        negative: json["negative"] == null ? null : json["negative"],
        pending: json["pending"] == null ? null : json["pending"],
        hospitalizedCurrently: json["hospitalizedCurrently"] == null ? null : json["hospitalizedCurrently"],
        hospitalizedCumulative: json["hospitalizedCumulative"] == null ? null : json["hospitalizedCumulative"],
        inIcuCurrently: json["inIcuCurrently"] == null ? null : json["inIcuCurrently"],
        inIcuCumulative: json["inIcuCumulative"] == null ? null : json["inIcuCumulative"],
        onVentilatorCurrently: json["onVentilatorCurrently"] == null ? null : json["onVentilatorCurrently"],
        onVentilatorCumulative: json["onVentilatorCumulative"] == null ? null : json["onVentilatorCumulative"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        dateChecked: json["dateChecked"] == null ? null : json["dateChecked"],
        death: json["death"] == null ? null : json["death"],
        hospitalized: json["hospitalized"] == null ? null : json["hospitalized"],
        totalTestResults: json["totalTestResults"] == null ? null : json["totalTestResults"],
        lastModified: json["lastModified"] == null ? null : json["lastModified"],
        total: json["total"] == null ? null : json["total"],
        posNeg: json["posNeg"] == null ? null : json["posNeg"],
        deathIncrease: json["deathIncrease"] == null ? null : json["deathIncrease"],
        hospitalizedIncrease: json["hospitalizedIncrease"] == null ? null : json["hospitalizedIncrease"],
        negativeIncrease: json["negativeIncrease"] == null ? null : json["negativeIncrease"],
        positiveIncrease: json["positiveIncrease"] == null ? null : json["positiveIncrease"],
        totalTestResultsIncrease: json["totalTestResultsIncrease"] == null ? null : json["totalTestResultsIncrease"],
        hash: json["hash"] == null ? null : json["hash"],
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "states": states == null ? null : states,
        "positive": positive == null ? null : positive,
        "negative": negative == null ? null : negative,
        "pending": pending == null ? null : pending,
        "hospitalizedCurrently": hospitalizedCurrently == null ? null : hospitalizedCurrently,
        "hospitalizedCumulative": hospitalizedCumulative == null ? null : hospitalizedCumulative,
        "inIcuCurrently": inIcuCurrently == null ? null : inIcuCurrently,
        "inIcuCumulative": inIcuCumulative == null ? null : inIcuCumulative,
        "onVentilatorCurrently": onVentilatorCurrently == null ? null : onVentilatorCurrently,
        "onVentilatorCumulative": onVentilatorCumulative == null ? null : onVentilatorCumulative,
        "recovered": recovered == null ? null : recovered,
        "dateChecked": dateChecked == null ? null : dateChecked,
        "death": death == null ? null : death,
        "hospitalized": hospitalized == null ? null : hospitalized,
        "totalTestResults": totalTestResults == null ? null : totalTestResults,
        "lastModified": lastModified == null ? null : lastModified,
        "total": total == null ? null : total,
        "posNeg": posNeg == null ? null : posNeg,
        "deathIncrease": deathIncrease == null ? null : deathIncrease,
        "hospitalizedIncrease": hospitalizedIncrease == null ? null : hospitalizedIncrease,
        "negativeIncrease": negativeIncrease == null ? null : negativeIncrease,
        "positiveIncrease": positiveIncrease == null ? null : positiveIncrease,
        "totalTestResultsIncrease": totalTestResultsIncrease == null ? null : totalTestResultsIncrease,
        "hash": hash == null ? null : hash,
    };
}
