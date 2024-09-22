class Helper{

  static double calculateCalories(double weight, double durationInMinutes, double metValue) {
    // Convert duration to hours
    double durationInHours = durationInMinutes / 60;

    // Calculate calories burned
    double caloriesBurned = metValue * weight * durationInHours;

    return caloriesBurned;
  }
}