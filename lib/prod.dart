class products {
  int _value;

  products(this._value);

  int get value => this._value;

  set value(int value) {
    this._value = value;
  }
}

List myProducts = [
  products(0),
  products(0),
  products(0),
  products(0),
  products(0)
];
