import 'package:flutter/material.dart';
import 'package:jx3_app/api/home.dart';
import 'package:jx3_app/components/customCard/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _serverList = [];

  @override
  void initState() {
    super.initState();
    _getServerList();
  }

  void _getServerList() async {
    _serverList = await getServerListApi();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("剑网三小助手"),
        ),
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            if (_serverList.isNotEmpty) ...[
              ServerCard(serverList: _serverList),
              SizedBox(height: 20),
            ],
            MenuCard()
          ],
        ));
  }
}

class ServerCard extends StatefulWidget {
  final dynamic serverList;

  const ServerCard({super.key, required this.serverList});

  @override
  State<ServerCard> createState() => _ServerCardState();
}

class _ServerCardState extends State<ServerCard> {
  var _currentServerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomInfoCard(
      title: Text(
        "当前服务器：${widget.serverList[_currentServerIndex]['server_name']}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("点击选择服务器"),
          SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.serverList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentServerIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 92, 186, 248),
                    ),
                    child: Text(
                      widget.serverList[index]['server_name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  const MenuCard({super.key});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  final List<Map> _menus = [
    {"icon": "⚔️", "title": "今日活动", "route": "/calendar"},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomInfoCard(
      content: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(_menus.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                _menus[index]['route'],
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 234, 170),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(100),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                _menus[index]['title'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
