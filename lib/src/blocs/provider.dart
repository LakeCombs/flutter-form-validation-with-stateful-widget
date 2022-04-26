import "package:flutter/material.dart";
import "bloc.dart";

class Provider extends InheritedWidget {
  // @override
  // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  //   // TODO: implement updateShouldNotify
  //   throw UnimplementedError();
  final bloc = Bloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>(
            aspect: Provider) as Provider)
        .bloc;
  }
}
