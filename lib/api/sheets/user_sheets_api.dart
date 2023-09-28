import 'package:bhimani_classes/model/user.dart';
import 'package:gsheets/gsheets.dart';
import 'package:bhimani_classes/api/sheets/user_sheets_api.dart';

class UserSheetsAPI{
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheets-399017",
  "private_key_id": "3fdbfc50f53d6008ceb8f728238b84e236604669",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQCqfzETXrFdbEpr\nypDeijglPO2DkFvWhrFA3qatZDJvrEjgXyca9LAD/Gw9dQ8l4CdI37e2EodK9ODP\nT5LSY2u/+aGxniUs7T3Ai09Q+sWJbTz8MCzTRSQH7KtdVcxYC5fflH+A7Spp8CXU\nVM3gRBulgDNvl4BcanNJVfETVRpCi0ZXoX5seup1zupVJS0NRZnZ9E+//+LqmRdG\nKjLXRr+veH3tsSFRyR1OI3SkDteySPolltjFhuzOwNEnCRC03aBEuuFaBsW1yHUe\nF0V7gRe5UIskqWaAkvIJ+RbMUhiA/BcNaM4Vv6V9bEY9d/ioU9vrzcLEHxI0Zbvo\n9d5htPVpAgMBAAECgf9JXsg/uFWbXn6oOa5za10TU/o3eRK3FD+IgEg6AGReqkVc\n85W12UE7IJAejRbNCykyCGmGcMgdTu7E8qQRkGH4u0mvUImu9mkcnYFZ1+YqEwMA\n2Q/Ghc/Q7ogld5v4R6+TsiksfONDs5ST9eqiwqx4YYhrp/FqfmTI/7LpdDYDbDa8\nM0rEAnahGFhEbxIboTnINkPz33bM0LR23ePuINt8FXdz4fQOQDZc4uqHmHclWhjt\nysSUoAzeHpX3yGbDjWNzlJ8e5DsZb0JkPHqf3q5maEfbrfuZdV7Fzf2R/3piH45H\n8Ib7IolwNOsuU5R4R36Mdx6l3tLQaXGZf2JQMGcCgYEA7V/YmPxBJKKv2nzkghgZ\nlKSMa7cF6/vXWKNJdqMBBr156KjnXdTmp4KAvPGNA9uugVl95m4KXgdXkxcJj0Fq\n4tHTtnCayy8P3ymWk5KN3Xc28apRbhQXaOvqjSZ06S3qMC0TSz27tDG8BlOhfmyf\nAXpZSzADE+xnWURmXy7TBHcCgYEAt9/423KffE3ByOcYxAjYXVQljax6vTYk4Trq\nwVLTML4742q0rlSE4yKL/mEmDPvSEFm3R3RlBCUg7U1+11I/ppb+PEJ38UCfvXm9\nzPTri7yqaf+qDwNGjBDerS6a2HWw1UiGwWHm2qmfJ2ND3LD+6MkTo9qek7wFiC71\nx6y1rR8CgYAeZypM3fJSCOxRJbH237NXEIRTv4tooEcCuVdNdK9K97XHkOqhYAVy\n6womKSIQnnCJbLbtbqaxSGt1EXxN9ukDyDA/q8iHwa1cvezlVd4JwZ0t8syfNr+Q\n1raiAYzz2MeoB/3yoyOJft1ASjHjCXKMM+l/8dRTFvJdwp8CDfNFHQKBgHXp6CF6\nKPJCvvGB2SzlazK2Ynquz+sEjLPu31poLcyFQcx9wi5FPw6VOedAD3GmDziy/8iP\nyLPWx33GA4A7W1wOWiz0hwwr4ARWzLNhoKd0rmfZLwn/lL7/lnzCdUQ4fNTZdKkQ\nikVRHyHYE020J1PKlpCuAqFEotuJGc4ZYEwLAoGBAMgjN7OUARQyl2+7sCoL9eNp\nICcdWyyZ3ULn3c+aOLrvqWdBbddSQv6zrpWR8IgkqERvW3kQpvfDbEmtY0aKlu1u\nX9rFxZ9iCThpS7YNdjsaGZC/aPSgwbf20QYE9c3aHnkfGNqV2Nl21nPtPh2LGPAZ\nP2JZxNjloYApiM+hZEHZ\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-399017.iam.gserviceaccount.com",
  "client_id": "110361924398967402589",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-399017.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

  ''';
  static final _spreadsheetId='1kyOxSpVQN__Bx9VXOu6yjXSGEtqdZZxOyxRfHCNsZwE';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async{
    try{
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet,title: 'Users');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    }
    catch(e){
      print('Init error: $e');
    }
  }

  
  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        required String title,
      }) async{
    try{
      return await spreadsheet.addWorksheet(title);
    } catch(e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async{
    if(_userSheet==null) return 0;
    
    final lastRow=await _userSheet!.values.lastRow();
    return lastRow==null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<User?>  getById(int id) async{
    if(_userSheet==null) return null;

    final json = await _userSheet!.values.map.rowByKey(id,fromColumn: 1);
    return json==null ? null : User.fromJson(json);
  }

  static Future<List<User>> getAll() async{
    if(_userSheet==null) return <User>[];

    final users = await _userSheet!.values.map.allRows();
    return users == null ? <User>[] : users.map(User.fromJson).toList();
  }

  static Future insert(List<Map<String,dynamic>> rowList) async{
    if(_userSheet==null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
    int id,
    Map<String,dynamic> user,
  ) async{
    if(_userSheet==null) return false;
    return _userSheet!.values.map.insertRowByKey(id, user);
  }

  static Future<bool> updateCell({
  required int id,
    required String key,
    required dynamic value,
}) async{
    if(_userSheet==null) return false;

    return _userSheet!.values.insertValueByKeys(
        value,
        columnKey: key,
        rowKey: id
    );
  }

  static Future<bool> deleteById(int id) async{
    if(_userSheet==null) return false;

    final index = await _userSheet!.values.rowIndexOf(id);
    if(index == -1) return false;
    return _userSheet!.deleteRow(index);
  }


}