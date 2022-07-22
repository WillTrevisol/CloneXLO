import 'dart:convert';

import 'package:clone_xlo_flutter/repositories/parse_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import 'table_keys.dart';

class UserRepository {

  late SharedPreferences sharedPreferences;

  UserRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  Future<User> signUp(User user) async {
    
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set<int?>(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      await sharedPreferences.setString(keyLocalUser, jsonEncode(response.result));
      return parseToUser(response.result);
    } else {
      return Future.error('${ParseErrors.getDescription(response.error!.code)}');
    }

  }

  Future<User> loginEmail(String email, String password) async {
    final ParseUser parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      final json = jsonEncode(response.result);
      await sharedPreferences.setString(keyLocalUser, json);
      return parseToUser(response.result);
    } else {
      return Future.error('${ParseErrors.getDescription(response.error!.code)}');
    }
  }

  Future<User?> currentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final json = sharedPreferences.getString(keyLocalUser) ?? '{}';
    final jsonDecoded = jsonDecode(json);
    ParseUser? parseUser = ParseUser(null, null, null).fromJson(jsonDecoded);

    if (parseUser != null) {
      final response = await ParseUser.getCurrentUserFromServer(parseUser.sessionToken ?? '');

      if (response!.success) {
        return parseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    } 

    return null;
  }

  Future<void> save(User user) async {

    final parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      parseUser.set<String>(keyUserName, user.name);
      parseUser.set<String>(keyUserPhone, user.phone);
      parseUser.set<int>(keyUserType, user.type.index);

      if (user.password != null) {
        parseUser.password = user.password;
      }

      final response = await parseUser.save();

      if (response.success) {
        final json = jsonEncode(response.result);
        await sharedPreferences.setString(keyLocalUser, json);
      } else {
        return Future.error('${ParseErrors.getDescription(response.error!.code)}');
      }

      if(user.password != null) {
        await parseUser.logout();

        final loginResponse = await ParseUser(user.email, user.password, null).login();

        if (!loginResponse.success) {
          return Future.error('${ParseErrors.getDescription(loginResponse.error!.code)}');
        }
      }
    }
  }

  Future<void> logout() async {

    // sharedPreferences = await SharedPreferences.getInstance();
    final ParseUser parseUser = await ParseUser.currentUser();

    
    final response =  await parseUser.logout();

    if (response.success) {
      await sharedPreferences.remove(keyLocalUser);
      return;
    } else {
      return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
    }
      
    
  }

  User parseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

}