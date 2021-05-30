import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USER = "_user";
const TOKEN = "_token";
const INST = "_instId";

/// Client Context is a `singleton` class.
/// It will hold all required client side contexts
/// such as login details, token, etc....
class ClientContext {
  BuildContext _screenContext;
  bool _isSpinnerShown = false;

  ClientContext._internal();
  static final ClientContext _singleton = ClientContext._internal();

  /// 
  /// Class members
  /// 
  static SharedPreferences _sessionStorage;
  Map _values = new Map<String,dynamic>();

  /// 
  /// Returns the singleton instance
  /// 
  factory ClientContext() {
    return _singleton;
  }

  /// 
  /// Set Details of the logged in user
  /// 
  setToken(final String token) {
    this.setValue(TOKEN, token);
  }

  /// 
  /// Destroy Details of the logged in user
  /// 
  destroyToken() {
    this.destroyValue(TOKEN);
  }

  /// 
  /// Details of the logged in user
  /// 
  Future<String> getToken() async {
    return (await this.getValue(TOKEN));
  }

  /// 
  /// Any [value] that is to be saved as part of session with a [key].
  /// This will survive page reloads
  /// 
  void setValue(final String key, final dynamic value) async {
    _sessionStorage = await SharedPreferences.getInstance();
    this._values[key] = value;
    if (value == null) {
      _sessionStorage.remove(key);
    } else {
      _sessionStorage.setString(key, json.encode(value));
    }
  }

  void destroyValue(final String key) async {
    _sessionStorage = await SharedPreferences.getInstance();
    if(this._values.containsKey(key)){
      this._values.remove(key);
      _sessionStorage.remove(key);
    }
  }

  /// 
  /// Gets a value for this [key] that is stored in shared prefs
  /// 
  Future<dynamic> getValue(String key) async {
    _sessionStorage = await SharedPreferences.getInstance();
    dynamic value = this._values[key];
    if (value != null) {
      return value;
    }
    final dynamic s = _sessionStorage.get(key);
    if (s == null) {
      return s;
    }
    value = s;
    this._values[key]=value;
    return value;
  }

  alert(BuildContext context,String title,String content, {GestureTapCallback action}){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
              child: CupertinoAlertDialog(
          title: Text(title),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:20),
              Text(content),
              SizedBox(height:10),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true, child: Text("OK"),
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                if(action!=null){action();}
              },
            )
          ],
        ),
      ),
    );
  }

  showSpinner(context, {String content = "Loading... "}){
    if(_isSpinnerShown){
      return;
    }
    _screenContext = context;
    _isSpinnerShown = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
              child: CupertinoAlertDialog(
          title: Text("VISACC"),
          content:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40,),
              Text(content),
              CupertinoActivityIndicator(animating: true)
            ],
          ),
        ),
      ),
    );
  }

  hideSpinner(context) {
    if(this._isSpinnerShown){
      this._isSpinnerShown = false;
      Navigator.pop(context, 'Cancel');
    }
    else{
      print("Hide Spinner called before calling show!");
    }
  }

  /// Displays a prompt to the user
  /// * [context] The build context
  /// * [title] Title of the prompt
  /// * [possitiveText] The text to display for possitive action
  /// * [onPossitiveTap] Possitive tap callback
  /// * [negativeText] The text to display for dissmissive action
  /// * [onNegativeTap] Negative tap callback
  showPrompt(context,String title,String content,String possitiveText ,GestureTapCallback onPossitiveTap,String negativeText,GestureTapCallback onNegativeTap){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:20),
            Text(content),
            SizedBox(height:10),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(possitiveText),
            onPressed:
              (){Navigator.pop(context, 'Cancel');onPossitiveTap();},
          ),
          CupertinoDialogAction(
            child: Text(negativeText),
            onPressed: () {Navigator.pop(context, 'Cancel');onNegativeTap();},
          ),
        ],
      ),
    );
  }

}