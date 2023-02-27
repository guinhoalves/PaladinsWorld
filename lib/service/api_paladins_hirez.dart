import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../utils/functions.dart';

class ApiPaladinsHirez {
  String devKey = '3712'; // devKey goes here
  String authKey = 'A95E29F9212A4155988E6DB70036A290'; // authKey goes here
  //string urlPrefix = "http://api.smitegame.com/smiteapi.svc/";
  String urlPrefix = 'https://api.paladins.com/paladinsapi.svc/';
  String lg = '10';

  Future<List?> getCardChampion({required String sessionId, required int champId}) async {
    var signature = getSignature(path: 'getchampioncards');
    String timesTamp = getTimestamp();
    var url = '${urlPrefix}getchampioncardsjson/$devKey/$signature/$sessionId/$timesTamp/$champId/$lg';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Request fail: getCardChampion() Message:${response.body} - CodStatus:${response.statusCode}');
      return null;
    }
  }

  Future<String?> createSession() async {
    var signature = getSignature(path: 'createsession');
    String timesTamp = getTimestamp();
    var url = '${urlPrefix}createsessionJson/$devKey/$signature/$timesTamp';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response);
      // if (response.body["ret_msg"] == "Approved") {
      //   return response.body["session_id"];
      // } else {
      //   //deu falha na criação da session_id
      //   print(response.body["ret_msg"]);
      //   return null;
      // }
    } else {
      //deu falha na request
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      print('Falha ao realizar a request MSG:${response.body}');
      return null;
    }
  }

  Future<List?> getChampions({required String sessionId}) async {
    var signature = getSignature(path: 'getchampions');
    String concat = getTimestamp();
    var url = '${urlPrefix}getchampionsjson/$devKey/$signature/$sessionId/$concat/$lg';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Falha ao realizar a request CodStatus:${response.statusCode}');
      // print('Falha ao realizar a request MSG:${response.body["ret_msg"]}');
      return null;
    }
  }

  String getSignature({required String path}) {
    var signature = '$devKey$path$authKey${DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc())}';
    return UtilsFunctions.getMD5(signature);
  }

  String getTimestamp() {
    return DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc());
  }
}
