import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/city.dart';
import '../models/uf.dart';
import 'table_keys.dart';

class IbgeRepository {

  Future<List<UF>?> getUFList() async {

    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(keyUfList)) {
      final jsonList = jsonDecode(sharedPreferences.getString(keyUfList)!);

      return jsonList.map<UF>((uf) => UF.fromJson(uf)).toList()
        ..sort(((UF a, UF b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())));
    }

    const endPoint = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      
      final response = await Dio().get<List>(endPoint);

      sharedPreferences.setString(keyUfList, jsonEncode(response.data));

      return response.data?.map<UF>((uf) => UF.fromJson(uf)).toList()
        ?..sort(((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())));

    } on DioError {
      return Future.error('Falha ao obter lista de estados.');
    }

  }

  Future<List<City>?> getCityListFromApi(UF uf) async {
    final String endPoint = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {

      final response = await Dio().get<List>(endPoint);
      final cityList = response.data?.map<City>((city) => City.fromJson(city)).toList()
        ?..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return cityList;
    } catch(e) {
      return Future.error('Falha ao obter lista de cidades.');
    }
  }

}