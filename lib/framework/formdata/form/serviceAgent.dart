import 'dart:convert';
import 'package:heritageFitness/framework/formdata/form/clientConfig.dart';
import 'package:heritageFitness/framework/formdata/form/clientContext.dart';
import 'package:heritageFitness/framework/formdata/form/conventions.dart';
import 'package:http/http.dart' as http;

/** 
 * This will get a [key] if it exits in the map.
 * Else it will return null
 */
extension DefaultMap<K,V> on Map<K,V> {
  V getOrNull(K key) {
    if (this.containsKey(key)) {
      return this[key];
    } else {
      return null;
    }
  }
}


class ServiceAgent {
  final ClientContext ctx = ClientContext();
  final ClientConfig config = ClientConfig();

  ServiceAgent();

	/** 
   * Serve this service. we use a strict service oriented architecture, 
	 * where in the only thing the client can ask the server is to serve a service.
	 * There is no concept of resources or operations. Any such concepts are to be 
	 * implemented using the service paradigm. 
   * 
	 * * [serviceName]  name of the service to be requested
	 * * [data] input data for the request
	 * * [asQueryParams] true if the data is just a set of name-string params, and the srver expects them in query string
	 * * [headers] any special headers to be communicated. Typically for additional authentication.
	 * * [withAuth] true if the request is to be sent with auth. If auth is not present, this wil trigger a login
   */
  Future serve(final String serviceName, {bool withAuth = true, Map options}) async {
    final String token = await this.ctx.getToken() ?? '';
    final Map<String,String> headers = {};
    headers[Conventions.CONTENT_TYPE] = 'application/json';
    headers[Conventions.HEADER_SERVICE] = serviceName;
    if (withAuth && token.isNotEmpty) {
			headers[Conventions.HEADER_AUTH] = token;
		}
    var data = options.getOrNull("data");
    final Uri url = Uri(host: this.config.url,);
    final obs = await http.post(url,headers: headers,body: jsonEncode(data));
    if(obs.statusCode != 200){
      print("This->"+obs.body.toString());
      final msg = 'Server Error. http-status :' + obs.statusCode.toString() + '=' + obs.reasonPhrase;
      print("ERROR: " + msg);
      throw ServiceException({ "type": 'error', "id": 'serverError', "text": msg });
    }
    // no-news is good-news!!
    // but has the server responded all ok?
    Map<dynamic,dynamic> result = json.decode(obs.body);
    if(result["allOk"] == false){
      throw ServiceException(result["messages"]);
    }
    if(result.getOrNull("token") != null){
      this._doLogin(result);
    }

    return result.getOrNull("data");
  }

  void _doLogin(Map<dynamic,dynamic> result){
    print("Logging the user '" + result["data"]["loginId"] +"' in......");
    this.ctx.setValue("userDetails", result["data"]);
    this.ctx.setValue("userId", result["data"]["userId"]);
    this.ctx.setValue("companyId", result["data"]["companyId"]);
    this.ctx.setToken(result.getOrNull("token"));
  }

}

class ServiceException implements Exception {
  dynamic cause;
  ServiceException(this.cause);
}