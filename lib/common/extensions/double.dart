extension DoubleExt on double {
  Future<void> wait() => Future.delayed(
        Duration(
          seconds: (this * 10).toInt(),
        ),
      );
}
