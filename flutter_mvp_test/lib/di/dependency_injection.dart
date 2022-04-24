import 'package:flutter_mvp_test/data/contact_data.dart';
import 'package:flutter_mvp_test/data/contact_mock_data.dart';

enum Flavor{
  MOC , PROD
}

class Injector{
  static final Injector _instance = Injector._internal();
  static Flavor ?_flavor  ;

  static void configure(Flavor flavor){
    _flavor = flavor ;
  }
  factory Injector(){
    return _instance ;
  }
  Injector._internal();

  ContactDataRepository get contactDataRepository{
    switch(_flavor){
      case Flavor.MOC:
        return ContactDataMocRepositoryImp();
      default:
        return ContactDataRepositoryImp();
    }
  }
}