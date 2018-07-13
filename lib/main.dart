import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'groupdetails.dart';
import 'groupstatus.dart';
import 'homepage.dart';
import 'loadingindicator.dart';
import 'signinpage.dart';
import 'signuppage.dart';



var popflag=0;
List<UserData> users=new List<UserData>();
LoginDetails logindet = new LoginDetails();
GroupDetails grpd=new GroupDetails();


final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.blueGrey,
  accentColor: Colors.blueGrey,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.blueGrey,
  accentColor: Colors.blueGrey,
);


void main() {
  defaultTargetPlatform == TargetPlatform.iOS
      ? MapView.setApiKey("AIzaSyCLw1SjRi8TLDu_Nzcdo2Ufu68H1UXl9BU")
      : MapView.setApiKey("AIzaSyB4xaxweIhP0F36ZCBpfeiDjpoPc741Oe0");

  runApp(new MaterialApp(
    title: "Trovami",
    home: new SignInForm(),
    theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {

          case '/a': return defaultTargetPlatform == TargetPlatform.iOS
              ? new CupertinoPageRoute(builder:  (_) => new SignupLayout(),settings: settings,)
              : new MyCustomRoute(
            builder: (_) => new SignupLayout(),
            settings: settings,
          );

          case '/b': return defaultTargetPlatform == TargetPlatform.iOS
              ? new CupertinoPageRoute(builder:  (_) => new Homepagelayout(),settings: settings,)
              :new MyCustomRoute(
            builder: (_) => new Homepagelayout(),
            settings: settings,
          );
          case '/c': return defaultTargetPlatform == TargetPlatform.iOS
              ? new CupertinoPageRoute(builder:  (_) => new AddGroup(),settings: settings,)
              :new MyCustomRoute1(
            builder: (_) => new AddGroup(),
            settings: settings,
          );
          case '/d': return defaultTargetPlatform == TargetPlatform.iOS
              ? new CupertinoPageRoute(builder:  (_) => new GroupStatusLayout(),settings: settings,)
              :new MyCustomRoute1(
            builder: (_) => new GroupStatusLayout(),
            settings: settings,
          );
          case '/g': return defaultTargetPlatform == TargetPlatform.iOS
              ? new CupertinoPageRoute(builder:  (_) => new LoadingIndLayout(),settings: settings,)
              :new MyCustomRoute1(
            builder: (_) => new LoadingIndLayout(),
            settings: settings,
          );
        }
        assert(false);
      }
  ),
  );
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    return new FadeTransition( opacity: animation, child: child);
  }
}

class MyCustomRoute1<T> extends MaterialPageRoute<T> {
  MyCustomRoute1({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  Widget transitionBuilder(BuildContext context,
      Animation<Offset> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    return new SlideTransition( position: animation, child: child);
  }
}


class UserData {
  UserData({this.emailId,this.password,this.name,this.locationShare,this.groupsIamin,this.location});
   String emailId ;
   String password;
   String name;
   bool locationShare;
  Map<String,double> location;
   List<String> groupsIamin=[];


  UserData.fromJson(Map value){
    emailId=value["emailid"];
    name=value["name"];
    locationShare=value["locationShare"];
    groupsIamin=value["groupsIamin"];
  }
   Map toJson(){
     return {"name": name,"locationShare": locationShare,"groupsIamin":groupsIamin,"emailid":emailId,"location":location};
   }
}

class LoginDetails {
  LoginDetails({this.emailId,this.password});
  String emailId = '';
  String password = '';
  //String name = '';
}


class GroupDetails {
  GroupDetails({this.groupname,this.groupmembers});
  String groupname = "";
  List<UserData> groupmembers=[];

  GroupDetails.fromJson(Map value){
    groupname=value["groupname"];
//    print("value of members:${value["members"]}");
      groupmembers=value["members"];

  }
  Map toJson(){
    return {"groupname": groupname,"members":groupmembers};
  }

}


class CurrentLoc{
  String emailId;
  Map<String,double> currentLocation;
  CurrentLoc({this.emailId,this.currentLocation});
}

class LocationClass{
  double latitude;
  double longitude;

  LocationClass({this.latitude, this.longitude});

  Map toJson(){
    return {"latitude":latitude,"longitude":longitude};
  }

}

