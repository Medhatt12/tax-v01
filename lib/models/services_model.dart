class Services{
  String serviceName;
  String imageURL;
  String description;

  Services({
    this.serviceName,
    this.imageURL,
    this.description,
  });
}
List<Services> services =[
  Services(
    serviceName: 'Book an appointment',
    imageURL: 'assets/images/calendar-icon.png',
    description: 'Now you can book an appointment with a lawyer'
  ),
  Services(
    serviceName: 'Tax online payment',
    imageURL: 'assets/images/onlinepaymenticon.png',
    description: 'Now you can pay all residential taxes with a click of a button'
  ),
  Services(
    serviceName: 'And more services',
    imageURL: 'assets/images/andmoreicon.png',
    description: 'Coming soon'
  ),
];
