class Events {
  final String eventName;
  final String eventDescription;
  final DateTime eventDate;
  final double eventBudget;

  Events(this.eventName, this.eventDescription, this.eventDate,
      [this.eventBudget = 0]);
}
