class dateDetails {
  String title;
  String Image;
  String descripation;
  dateDetails(
      {required this.Image, required this.descripation, required this.title});
}

List<dateDetails> details = [
  dateDetails(
      Image: 'assets/logo/mobile2.png',
      descripation: 'pick your food from our menu\n     more than 35 item',
      title: 'Esay and online payment'),
  dateDetails(
      Image: 'assets/logo/mobile.png',
      descripation: 'Food and groceries delivery from',
      title: 'select from your from best menu'),
  dateDetails(
      Image: 'assets/logo/mobile2.png',
      descripation: 'Food delivery is a  in which\n     a restaurant',
      title: 'select from your from best menu')
];
