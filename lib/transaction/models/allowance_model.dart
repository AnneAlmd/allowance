class AllowanceModel {
  double _value = 0;

  double get allowanceGet => _value;

  static final AllowanceModel _allowance = AllowanceModel._internal();

  factory AllowanceModel() => _allowance;

  AllowanceModel._internal();

  void allowanceSet(double value) {
    this._value += value;
  }
}
