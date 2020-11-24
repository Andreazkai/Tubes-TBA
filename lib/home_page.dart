import 'package:aksaraapp/konversi_bloc.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _latinToAksara = true;
  var _domainTextController = TextEditingController();
  String _targetText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hanacaraka"),
      ),

      // ignore: missing_return
      body: BlocListener<KonversiBloc, void>(listener: (context, state) {

      }, child: BlocBuilder<KonversiBloc, void>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  PreferredSize(
                    preferredSize: Size(_size.width, 56),
                    child: Material(
                      // color: Colors.white,
                      elevation: 2.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 56,
                                width: _size.width,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  (_latinToAksara) ? "Latin" : "Aksara",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(Icons.compare_arrows),
                                color: Colors.grey[700],
                                onPressed: () {
                                  setState(() {
                                    _latinToAksara = !_latinToAksara;
                                  });
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 56.0,
                                width: _size.width,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  (_latinToAksara) ? "Aksara" : "Latin",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 0, bottom: 20, left: 20, right: 20),
                      // decoration: BoxDecoration(color: Colors.white),
                      width: _size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                Spacer(),
                                if (_domainTextController.text
                                    .toString()
                                    .trim()
                                    .isNotEmpty)
                                  IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _domainTextController.text = "";
                                      setState(() {
                                        _targetText = "";
                                      });
                                    },
                                  )
                              ],
                            ),
                          ),
                          TextField(
                            controller: _domainTextController,
                            maxLines: null,
                            style: TextStyle(
                              fontSize: 24),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: (_latinToAksara)
                                    ? "Tulis sesuatu dalam latin"
                                    : "Tulis sesuatu dalam aksara jawa"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    width: _size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              _targetText,
                              style: TextStyle(
                                  fontSize: 24),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }


}
