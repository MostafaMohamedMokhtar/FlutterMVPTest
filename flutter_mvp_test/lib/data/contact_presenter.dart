import 'package:flutter_mvp_test/data/contact_data.dart';
import 'package:flutter_mvp_test/di/dependency_injection.dart';
import 'package:flutter_mvp_test/model/user.dart';

abstract class ContactContract{
  void onLoadContactsComplete(List<User> contacts) ;
  void onLoadContactsError();
}

class ContactPresenter {
  ContactContract ?_view ;
  ContactDataRepository ?_repository ;

  ContactPresenter(this._view){
    _repository = Injector().contactDataRepository ;
  }

  void loadContacts(){
    assert(_view != null );
    _repository?.fetchContacts()
        .then((contacts) => _view?.onLoadContactsComplete(contacts))
        .catchError((onError){
          print('onError: $onError');
          _view?.onLoadContactsError();
    });
  }

}