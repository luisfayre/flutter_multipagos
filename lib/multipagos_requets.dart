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
      this.mpCustomername = "",
      required this.mpCurrency,
      required this.mpUrlFailure,
      required this.mpUrlsucces,
      required this.mpSignature,
      required this.mpProduct,
      this.mpEmail = "",
      this.mpPhone = ""});

  /// Es el identificador único de comercio, este valor es proporcionado por personal de Flap.
  String mpAccount;
  /// Según necesidad del cliente. Divisiones: sucursales, áreas, secciones, etc. – El valor a enviar se confirma en pruebas de conectividad.
  String mpNode;
  /// Identificador de transacción. Sólo se aceptan números y letras.
  /// 
  /// Longitud 1 a 30
  String mpOrder;
  /// Identificador de transacción. Sólo se aceptan números y letras.
  /// 
  /// Longitud 1 a 30
  String mpReference;
  /// Según necesidad del cliente. Clasificación de los cobros o pagos. - El valor a enviar se confirma en pruebas de conectividad.
  String mpConcept;
  /// Se deben colocar 2 decimales aunque sea un monto entero: 1.00
  String mpAmount;
  /// Nombre del contribuyente/pagador. Puede ser distinto del titular del medio de pago.
  /// 
  /// Es un parámetro informativo donde se debe enviar el nombre del usuario que está pagando. Este campo puede diferir del nombre del titular de la tarjeta de crédito.
  String mpCustomername;
  /// Pesos (1) o dólares americanos (2)
  String mpCurrency;
  /// Este parámetro indica cual es la URL donde Multipagos enviara post de respuesta en caso de que el pago sea exitoso.
  String mpUrlsucces;
  /// 
  String mpUrlFailure;
  /// Valor cifrado utilizado para seguridad. Se verifica que los parámetros no
  /// hayan sido alterados. El valor a cifrar es la concatenación de los parámetros mp_order + mp_reference + mp_amount
  String mpSignature;
  /// Es el identificador único del producto Multipagos. Tiene siempre el valor “1”.
  String mpProduct;
  /// Correo electronico del cliente para no enviar dejar vacio
  /// 
  /// Contiene el correo electrónico del usuario que realiza la transacción. En caso de no ser enviado Multipagos lo solicitará al usuario. Si tuviera un valor correcto, el usuario recibirá por mail un comprobante por la transacción.
  String mpEmail;
  /// Telefono del cliente para no enviar dejar vacio
  /// 
  /// Contiene el teléfono del usuario que realiza la transacción, y que será utilizado sólo en caso de necesitarse alguna aclaración. En caso de no ser enviado, Multipagos lo solicitará al usuario
  String mpPhone;

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
