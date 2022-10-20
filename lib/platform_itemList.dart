import 'package:flutter/material.dart';

final List<UserModel> userList = [
  UserModel('678eyr7fer', 'user1'),
  UserModel('678eycs3', 'user2'),
  UserModel('dgr73jsy', 'user3'),

];

class UserModel {
  final String walletId; final String username;
  UserModel(this.walletId, this.username);

  String searchThings() {
    return username+walletId;
  }
  // userAsStringByName() {
  //   return username;
  // }
}

class UserItemsWidget extends StatelessWidget {
  final List<UserModel> users;

  const UserItemsWidget(this.users);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        UserModel user = users[index];
        return GestureDetector(
      onTap: (){ print(user);},
      child: Container(
        padding: EdgeInsets.all(5),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.all(10),
              child: Text( user.username + '  ' +user.walletId,
                style: TextStyle(decoration: TextDecoration.none,fontSize: 20,color: Colors.black,fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        ),
    );
      },
    );
  }
}


