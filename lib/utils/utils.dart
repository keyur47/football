class Utils {
  Utils._instance();
  static Utils instance = Utils._instance();
  String xmlFormatString(String body) {
    String xmlFormat = '''<?xml version="1.0"?>
                      <root>
                      $body
                     </root>''';
    return xmlFormat;
  }
}
