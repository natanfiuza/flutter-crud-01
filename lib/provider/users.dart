import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'dart:math';

class Users with ChangeNotifier {
  final Map<String, User> _itens = {...DUMMY_USERS};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  /**
  * Retorna um item pelo seu indice
  */
  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  /**
   * Insere um item no Map
   */
  void put(User user) {
    if (user == null) {
      return;
    }
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      _itens.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final String id = Random().nextDouble.toString();
      _itens.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }
  void remove(User user) {
    if(user != null && user.id != null) {
      _itens.remove(user.id);
      notifyListeners();
    }
  }
}
