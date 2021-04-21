class Charts{
  String chartName;
  String imageURL;
  //String description;

  Charts({
    this.chartName,
    this.imageURL,
  });
}

List <Charts> charts = [
  Charts(
    chartName: 'Paid vs Saved',
    imageURL: 'assets/images/chart-icon.png'
  ),
  Charts(
    chartName: 'Tax per unit',
    imageURL: 'assets/images/chart-icon.png'
  ),
  Charts(
    chartName: 'Total paid',
    imageURL: 'assets/images/chart-icon.png'
  ),
];