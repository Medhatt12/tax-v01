class Dashboardelements{
  String elementName;
  String imageURL;
  //String description;

  Dashboardelements({
    this.elementName,
    this.imageURL,
  });
}

List <Dashboardelements> elements = [
  Dashboardelements(
    elementName: 'Owned Units',
    imageURL:'assets/images/ownedunits-icon.png'
  ),
   Dashboardelements(
    elementName: 'Inhabited Units',
    imageURL:'assets/images/inhibitedunit-icon.png'
  ),
  Dashboardelements(
    elementName: 'Uninhabited Units',
    imageURL:'assets/images/uninhabitedunit-icon.png'
  ),
  Dashboardelements(
    elementName: 'Total Annual Tax',
    imageURL:'assets/images/annualtax-icon.png'
  ),
];