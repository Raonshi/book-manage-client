import 'dart:async';

Timer debouncer(Timer? debounce, Function onDebounce) {
  if (debounce?.isActive ?? false) {
    debounce!.cancel();
  }
  debounce = Timer(const Duration(milliseconds: 300), () {
    onDebounce();
  });
  return debounce;
}
