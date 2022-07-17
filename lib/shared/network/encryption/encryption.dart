
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:pointycastle/asymmetric/api.dart';


String modules = '''MIICCgKCAgEAx9nDisVsWLsi6miogXbdUP9ikxf9A+KEMTx6zQPQMdEJJ4cBj1fvig
3wikWWE5TnRDGfSiUF36L7sEzEcgHL99WvvWONIxj+JKuBBo0p8FAxnMPtXrSmy5v3lhj1z370xv1adH+PVJPQ
MMFOEwx5VE05dCrDKedV9py8u51MXYsf0EeMG97enS5cUbEEuLu0rTerEGOfMQtRtbnQGHzIJRMm0R47IBsuHw
s9plk9C8LiURvOPCy44POALdD3EcG9vnSDxnOpQuxjuKMBaNW+p80fvf5fF03uZl0kHjVdyBJS82isdARsx3OO
qwpWWk3pLmyVe/98R9Pfi5ouU0D27Q+tcOrhmHr/sRiqA9l79AzdYAx+28KRqmopnsN+02ZboCYrnCoO1zE5hp
+r/pr6UCzlUtN6pnBOpIt9r2bxr10YbqwpXNMnDYF1zRsDvT99ymmnI/mamR957/ppVv6v019vDIcBPGbubAdy
MsXURUP+EQoMSrTag2Wx5FW3Sh8ivgcX3pvwvZSj0bjo+aS4YtKxGaMkMtKy0YaJFxtaPBrK32LtbzpdhfMSgt
Q1WCZFv3FyIBwdFtiO2AA9lJbgAaKH1mmOzWmatbMFVSOxSqVy5Y22ZwEu85XWkMPQB18iyXNl2zI3VcUCFj0l
RCnwAGZZRCHe6fixP3WaFaReGoECAwEAAQ==''';
var pem =
    '-----BEGIN RSA PUBLIC KEY-----\n$modules\n-----END RSA PUBLIC KEY-----';

Future<String> encryptByPublicKey(String value) async {

//
  final publicKey = RSAKeyParser().parse(pem) as RSAPublicKey;
  final encrypter = Encrypter(RSA(publicKey: publicKey,encoding: RSAEncoding.PKCS1));
  var result=encrypter.encrypt(value).base64;
  debugPrint(result);
  return result;
}

Future<String> decryptByPublicKey(String value) async {

//
  final publicKey = RSAKeyParser().parse(pem) as RSAPublicKey;
  final encrypter = Encrypter(RSA(publicKey: publicKey,encoding: RSAEncoding.PKCS1));
  var result=encrypter.decrypt64(value);
  debugPrint(result);
  return result;
}





