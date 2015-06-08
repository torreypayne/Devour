function sm2(n) {
  if (n === 1) {
    return 1;
  } else if (n === 2) {
    return 6;
  } else {
    return sm2(n-1) * this.ef;
  }
}

function update_ef(ef, q) {
  return (ef- 0.8 + 0.28 * q - 0.02 * (q*q));
}
