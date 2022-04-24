import 'package:flutter_mvp_test/data/contact_data.dart';
import 'package:flutter_mvp_test/model/user.dart';

class ContactDataMocRepositoryImp implements ContactDataRepository{
  @override
  Future<List<User>> fetchContacts() {
    List<User> contacts = [
      User(name: Name(first: 'Mostafa' , last: 'Mokhtar'),
          picture: Picture(medium: 'https://randomuser.me/api/portraits/med/women/32.jpg'),
          email: 'm@m.com', phone: '010111111'),
      User(name: Name(first: 'Ahmed' , last: 'Mokhtar'),
          picture: Picture(medium: 'https://randomuser.me/api/portraits/med/men/44.jpg'),
          email: 'm@m.com', phone: '010222222'),
      User(name: Name(first: 'Mahmoud' , last: 'Mokhtar'),
          picture: Picture(medium: 'https://randomuser.me/api/portraits/med/women/67.jpg'),
          email: 'm@m.com', phone: '010333333'),
    ];
    return  Future.value(contacts);
  }

}