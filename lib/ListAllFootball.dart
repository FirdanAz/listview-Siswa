import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listview_flutter/DetailPage.dart';
import 'package:listview_flutter/PremiereLeagueModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ListAllFootball extends StatefulWidget {
  const ListAllFootball({Key? key}) : super(key: key);

  @override
  State<ListAllFootball> createState() => _ListAllFootballState();
}

class _ListAllFootballState extends State<ListAllFootball> {
  PremiereLeagueModel? premiereLeagueModel;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("status code " + res.statusCode.toString());
    premiereLeagueModel = PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("List Premiere League"),
      // ),
      body: Center(
        child: Container(
          child: isloaded
              ? ListView.builder(
              itemCount: premiereLeagueModel!.teams!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailPage(teams: premiereLeagueModel!.teams![index]);
                        }));
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 20,
                              height: 20,
                              child: Image.network(premiereLeagueModel!.teams![index].strTeamBadge.toString())),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(premiereLeagueModel!
                                  .teams![index].strTeam
                                  .toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

}