const int ASCII0 = 48;

String formatMoney(int amount) {
  if(amount % 100 == 0) return '${amount~/100}.00';
  if(amount % 100 < 10) return '${amount~/100}.0${amount%100}';
  return '${amount~/100}.${amount%100}';
}

int extractInt(String money) {
  int result = 0;
  money.runes.forEach((rune) {
    int digit = rune - ASCII0;
    if(digit < 10 && digit >= 0) {
      result = (result * 10) + digit;
    }
  });
  return result;
}
