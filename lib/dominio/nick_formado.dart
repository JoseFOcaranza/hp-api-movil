class NickFormado {
  late final String valor;
  NickFormado._(this.valor);

  factory NickFormado.constructor(String propuesta) {
    if (propuesta.trim().isEmpty) {
      throw ('Nick mal formado');
    }
    return NickFormado._(propuesta);
  }
}
