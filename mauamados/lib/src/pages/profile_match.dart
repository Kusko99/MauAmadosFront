import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfileMatch extends StatefulWidget {
  final User user;
  final double fontSize;

  const ProfileMatch ({
    required this.user,
    required this.fontSize,
    super.key
  });

  @override
  State<ProfileMatch> createState() => _ProfileMatchState();
}

class _ProfileMatchState extends State<ProfileMatch> {

  @override
  Widget build (BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: max(deviceHeight * 0.07, 36.0),
        leadingWidth: max(deviceHeight * 0.07, 36.0),
        foregroundColor: const Color.fromARGB(255, 0, 71, 133),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: deviceWidth,
            child: Column(
              children: [
                UserCard(user: widget.user, onUserChanged: (n){}, match: true,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.05
                  ),
                  child: Wrap(
                    children: 
                      InterestsBuilder(interesses: widget.user.interesses, fontSize: widget.fontSize).buildInterests()
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: deviceHeight * 0.05,
                    left: deviceWidth * 0.05,
                    right: deviceWidth * 0.05
                  ),
                  child: Text(
                    widget.user.bio,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: Colors.black
                    )
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}