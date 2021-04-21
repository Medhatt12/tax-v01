class Units {
  String unitType;
  String imageURL;
  int indexed;
  //String description;

  Units({
    this.unitType,
    this.imageURL,
    this.indexed
  });
}

List<Units> units = [
  Units(
      unitType: 'Inhabited Units',
      imageURL: 'assets/images/inhibitedunit-icon.png',
      indexed: 0,
      ),
      
  Units(
      unitType: 'Uninhabited Units',
      imageURL: 'assets/images/uninhabitedunit-icon.png',
      indexed: 1,
      ),
];
