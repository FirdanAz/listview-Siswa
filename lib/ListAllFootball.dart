import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listview_flutter/PremiereLeagueModel.dart';

class ListAllFootball extends StatefulWidget {
  const ListAllFootball({Key? key}) : super(key: key);

  @override
  State<ListAllFootball> createState() => _ListAllFootballState();
}

class _ListAllFootballState extends State<ListAllFootball> {
  PremiereLeagueModel? premiereLeagueModel;
  String? nama;

  void getData() async{
    final res = await http.get(
      Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"
      )
    );
    print("Status Code : ${res.statusCode.toString()}");
    premiereLeagueModel =
        PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 1 : " + premiereLeagueModel!.teams![1].strTeam.toString());
    nama = '${premiereLeagueModel!.teams![1].strTeam}';

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(

      ),
    );
  }
}
