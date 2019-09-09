import 'package:desafio_picpay/src/pages/home/components/appbar_component.dart';
import 'package:desafio_picpay/src/pages/home/components/item_contact_component.dart';
import 'package:desafio_picpay/src/shared/models/users.dart';
import 'package:desafio_picpay/src/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final userRepository = UserRepository();
  UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    bloc.getSpeaker();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: StreamBuilder<UserResponse>(
            stream: bloc.subject.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: Text(
                        "Contatos",
                        style: TextStyle(fontSize: 30),
                      ),
                      expandedHeight: 200.0,
                      floating: true,
                      centerTitle: true,
                      forceElevated: true,
                      pinned: true,
                      primary: true,
                      bottom: AppBarComponent(),
                    ),
                    // SliverList(
                    //   delegate: SliverChildBuilderDelegate(
                    //     //childCount: snapshot.data.results.length,
                    //   ),
                    // ),

                    // SliverFixedExtentList(
                    //   itemExtent: 150.0,
                    //   delegate: SliverChildListDelegate(
                    //     [
                    //       Container(color: Colors.red),
                    //       Container(color: Colors.purple),
                    //       Container(color: Colors.green),
                    //       Container(color: Colors.orange),
                    //       Container(color: Colors.yellow),
                    //       Container(color: Colors.pink),
                    //     ],
                    //   ),
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));

    return Scaffold(
      backgroundColor: const Color(0xFF1D1E20),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Contatos',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'A quem deseja pagar?',
                labelStyle: TextStyle(
                  color: Colors.grey[50],
                ),
                prefixIcon: Icon(Icons.search),
                focusColor: Colors.greenAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            // Expanded(
            //   child: FutureBuilder<List<User>>(
            //     future: userRepository.fetchUsers(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       return ListView.builder(
            //         itemCount: snapshot.data.length,
            //         itemBuilder: (context, index) {
            //           return ItemContactComponent(
            //             user: snapshot.data[index],
            //             key: UniqueKey(),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
