extension IntExt on int {
  Future<void> wait() => Future.delayed(
        Duration(seconds: this),
      );
}
