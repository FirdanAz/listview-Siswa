import 'package:flutter/material.dart';
import 'package:listview_flutter/PremiereLeagueModel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.teams.strTeam}'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.all(40),
                    width: 100,
                    height: 100,
                    child: Image.network(widget.teams.strTeamBadge.toString())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
