import 'dart:convert';

MultipagosRequest multipagosRequestFromJson(String str) =>
    MultipagosRequest.fromJson(json.decode(str));

String multipagosRequestToJson(MultipagosRequest data) =>
    json.encode(data.toJson());

class MultipagosRequest {
  MultipagosRequest(
      {required this.mpAccount,
      required this.mpNode,
      required this.mpOrder,
      required this.mpReference,
      required this.mpConcept,
      required this.mpAmount,
      this.mpCustomername,
      required this.mpCurrency,
      required this.mpUrlFailure,
      required this.mpUrlsucces,
      required this.mpSignature,
      required this.mpProduct,
      this.mpEmail,
      this.mpPhone});

  String mpAccount;
  String mpNode;
  String mpOrder;
  String mpReference;
  String mpConcept;
  String mpAmount;
  String? mpCustomername;
  String mpCurrency;
  String mpUrlsucces;
  String mpUrlFailure;
  String mpSignature;
  String mpProduct;
  /// Correo electronico del cliente para no enviar dejar vacio
  String? mpEmail;
  /// Telefono del cliente para no enviar dejar vacio
  String? mpPhone;

  factory MultipagosRequest.fromJson(Map<String, dynamic> json) =>
      MultipagosRequest(
          mpAccount: json["mp_account"],
          mpNode: json["mp_node"],
          mpOrder: json["mp_order"],
          mpReference: json["mp_reference"],
          mpConcept: json["mp_concept"],
          mpAmount: json["mp_amount"],
          mpCurrency: json["mp_currency"],
          mpUrlsucces: json["mp_urlsuccess"],
          mpUrlFailure: json["mp_urlfailure"],
          mpSignature: json["mp_signature"],
          mpProduct: json["mp_product"],
          mpCustomername: json["mp_customername"],
          mpEmail: json["mp_email"],
          mpPhone: json["mp_phone"]);

  Map<String, dynamic> toJson() => {
        "mp_account": mpAccount,
        "mp_node": mpNode,
        "mp_order": mpOrder,
        "mp_reference": mpReference,
        "mp_concept": mpConcept,
        "mp_amount": mpAmount,
        "mp_currency": mpCurrency,
        "mp_urlsuccess": mpUrlsucces,
        "mp_urlfailure": mpUrlFailure,
        "mp_signature": mpSignature,
        "mp_product": mpProduct,
        "mp_customername": mpCustomername,
        "mp_email": mpEmail,
        "mp_phone": mpPhone
      };
}
