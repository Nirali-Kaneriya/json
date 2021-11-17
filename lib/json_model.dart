
import 'dart:convert';

import 'package:flutter/services.dart';

Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);

}

// To parse this JSON data, do
//
//     final myData = myDataFromJson(jsonString);


List<MyData> myDataFromJson(String str) => List<MyData>.from(json.decode(str).map((x) => MyData.fromJson(x)));

String myDataToJson(List<MyData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyData {
    MyData({
        this.id,
        this.name,
        this.description,
    });

    String? id;
    String? name;
    String? description;

    factory MyData.fromJson(Map<String, dynamic> json) => MyData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
