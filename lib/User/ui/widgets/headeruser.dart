import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/User/bloc/userbloc.dart';
import 'package:movies/User/model/usermodel.dart';
import 'package:movies/User/ui/widgets/personalinfouser.dart';

class HeaderUser extends StatelessWidget {
  UserModel userModel;
  UserBloc userBloc;
  HeaderUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return SafeArea(
      child: Container(
        child: FutureBuilder(
          future: userBloc.getInfoUser(),
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Container(),
                );
                break;

              case ConnectionState.waiting:
                return Center(
                  child: Container(),
                );
                break;

              case ConnectionState.active:
                if (snapshot.data == null) {
                  return Center(child: Text("Intenta mas tarde"));
                }
                return _showPersonalInfoUser(snapshot.data);
                break;
              case ConnectionState.done:
                if (snapshot.data == null) {
                  return Center(child: Text("Intenta mas tarde"));
                }
                return _showPersonalInfoUser(snapshot.data);
                break;
              default:
            }
          },
        ),
      ),
    );
  }

  Widget _showPersonalInfoUser(UserModel user) {
    return PersonalInfoUser(
      userModel: user,
    );
  }
}
