mixin ValidationsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? "Este campo é obrigatório";
    return null;
  }

  String? hasFiveChars(String? value, [String? message]) {
    if (value!.length < 5) return message ?? "Você deve usar pelo menos 5 caracteres!";
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
