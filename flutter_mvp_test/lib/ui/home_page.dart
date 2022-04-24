import 'package:flutter/material.dart';
import 'package:flutter_mvp_test/data/contact_presenter.dart';
import 'package:flutter_mvp_test/model/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements ContactContract {
  ContactPresenter ?_presenter ;
  List<User> ?_contacts ;
  bool ?_isLoading ;

  _MyHomePageState(){
    _presenter = ContactPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    _isLoading = true ;
    _presenter?.loadContacts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVP'),
      ),
      body: _isLoading == false ? ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          itemCount: _contacts?.length,
          itemBuilder: (BuildContext context , int index){
            return ListTile(
              title: Text('${_contacts?[index].name.first}${_contacts?[index].name.last}'),
              subtitle: Text('${_contacts?[index].email}'),
              leading: CircleAvatar(
                child: Image.network('${_contacts?[index].picture.medium}')
                // Text(''),
              ),
            );
          }
      ):Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void onLoadContactsComplete(List<User> contacts) {
    setState(() {
      _isLoading = false ;
      _contacts = contacts ;
    });
  }

  @override
  void onLoadContactsError() {
  }
}
