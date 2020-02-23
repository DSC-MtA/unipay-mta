String formatMoney(int amount) {
  if(amount % 100 == 0) return '${amount~/100}.00';
  if(amount % 100 < 10) return '${amount~/100}.0${amount%100}';
  return '${amount~/100}.${amount%100}';
}
