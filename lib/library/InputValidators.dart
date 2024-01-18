class InputValidators {
  static String? textRequired(String? val) {
    if (val == null || val.isEmpty) {
      return 'Lütfen Bu Alanı Doldurun';
    }
    return null;
  }

  static String? intRequired(String? val) {
    if (val == null || val.isEmpty) {
      return 'Lütfen Bu Alanı Doldurun';
    }
    final intValue = int.parse(val.toString().replaceAll(RegExp('[0-9]'), ''));
    if (intValue.toString() != val.toString().replaceAll(RegExp('^[0]+'), '')) {
      return 'Lütfen Geçerli Bir Fiyat Girin';
    }
    return null;
  }

  static String? vergiNoRequired(String? val) {
    if (val == null || val.isEmpty) {
      return 'Lütfen Bu Alanı Doldurun';
    }
    final intValue = int.parse(val.toString().replaceAll(RegExp('[^0-9]'), ''));
    if (intValue.toString() != val) {
      return 'Lütfen Geçerli Bir Fiyat Girin';
    }

    /*if (val.length < 9 || val.length > 11) {
      return 'InputValidators:VergiNumarasi';
    }*/
    return null;
  }
  /*static String? emailRequired(String? val){
    if (val == null || val.isEmpty) {
      return 'InputValidators:BuAlaniDoldurun';
    }
    if (val.isEmail==false) {
      return 'InputValidators:GecerliMail';
    }
    return null;
  }*/
  /*static String? phoneRequired(String? val){
    if (val == null || val.isEmpty) {
      return 'InputValidators:BuAlaniDoldurun';
    }
    if (val.replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '').replaceAll('+', '').replaceAll('-', '').isNumericOnly==false) {
      return 'InputValidators:GecerliTelefon';
    }
    return null;
  }*/
}
