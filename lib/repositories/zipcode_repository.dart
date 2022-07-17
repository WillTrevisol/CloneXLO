import 'package:clone_xlo_flutter/models/address.dart';
import 'package:clone_xlo_flutter/models/city.dart';
import 'package:clone_xlo_flutter/repositories/ibge_repository.dart';
import 'package:dio/dio.dart';

class ZipCodeRepository {

  Future<Address?> getAdress(String? zipCode) async {
    if (zipCode == null || zipCode.isEmpty) {
      return Future.error('CEP Inválido!');
    }

    final clearZipCode = zipCode.replaceAll(RegExp('[^0-9]'), '');

    if (clearZipCode.length != 8) {
      return Future.error('CEP Inválido!');
    }
    
    final String endPoint = 'https://viacep.com.br/ws/$clearZipCode/json/';

    try {
      final response = await Dio().get<Map>(endPoint);

      if (response.data!.containsKey('erro') && response.data?['erro']) {
        return Future.error('CEP Inválido!');
      }

      final ufList = await IbgeRepository().getUFList();

      return Address(
        uf: ufList?.firstWhere((uf) => uf.initials == response.data!['uf']), 
        city: City(name: response.data!['localidade']), 
        zipCode: response.data?['cep'], 
        district: response.data?['bairro'],
      );
    } catch (e) {
      return Future.error('Falha ao buscar CEP!');
    }
  }

}