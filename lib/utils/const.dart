const cloth = 'Clothes';
const electronics = 'Electronics';
const vegetable = 'Vegetables';
const apiurl = 'https://64da15aee947d30a260abe9f.mockapi.io/users';
final List<String> items = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

String truncateText(String text) {
  int maxLength = 5;
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}

timeConvert(dynamic text) {
  if (text.isNotEmpty) {
    String timeString = text.toString();
    String extractedValue = timeString.split('(')[1].split(')')[0];
    return extractedValue;
  }
}
