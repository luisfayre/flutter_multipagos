# Multipagos Flap BBVA

<img src="https://raw.githubusercontent.com/luisfayre/flutter_multipagos/main/img/logo.png">


## Screenshot

<img src="https://raw.githubusercontent.com/luisfayre/flutter_multipagos/main/img/multipagos.png">

## Get Started

### Android

Add this android/app/build.gradle

```java
defaultConfig {
  minSdkVersion 20
}
```

## Usage

Implementación de multipagos en flutter

```dart
  final String url = "URL PROPORCIONADO POR MULTIPAGOS";

  final requestMultipagos = MultipagosRequest(
    mpAccount: "1",
    mpNode: "1",
    mpOrder: "1",
    mpReference: "1",
    mpConcept: "1",
    mpProduct: "1",
    mpAmount: "100.00",
    mpCurrency: "1",
    mpSignature:
        "b3f5f7431983df4892b572e4dd0c16817e76077e0b668cd53786e470860567f8",
    mpUrlFailure: "URL Pago no  exitoso del cliente",
    mpUrlsucces: "URL Pago exitoso del cliente",
    mpCustomername: "",
    mpEmail: "",
    mpPhone: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Multipagos(
            title: widget.title,
            multipagos: requestMultipagos,
            bbvaEnv: url));
  }

```

## Additional information

Implementación de multipagos en flutter
