import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnesspal_user/utils/managers/string_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fitnesspal_user/model/workout_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutProvider with ChangeNotifier {
  final SharedPreferences prefs;

  WorkoutProvider(this.prefs);
  final List<WorkoutModel> _workouts = [];
  final List<WorkoutModel> _finishedWorkouts = [];
  final List<WorkoutModel> _heatMapData = [];
  final List<WorkoutModel> _allWorkouts = [];
  double? progressPercent;
  int? exercisesLeft;
  double? shownPercent;

  List<WorkoutModel> get workouts {
    return [..._workouts];
  }

  List<WorkoutModel> get finishedWourkouts {
    return [..._finishedWorkouts];
  }

  Map<DateTime, int> get heatMapData {
    return {
      for (var data in _heatMapData)
        DateTime(data.dateTime.year, data.dateTime.month, data.dateTime.day) : data.setNumber * data.repNumber
    };
  }

  List<WorkoutModel> get allWorkouts {
    return [..._allWorkouts];
  }

  Future<void> getProgressPercent() async {
    final int allWorkoutsNum = _allWorkouts.length;
    final int finishedWorkoutsNum = _finishedWorkouts.length;
    progressPercent = finishedWorkoutsNum / allWorkoutsNum;
    shownPercent = progressPercent! * 100;
    exercisesLeft = allWorkoutsNum - finishedWorkoutsNum;
  }

  Future<void> addNewWorkout({
    required String name,
    required int repNumber,
    required int setNumber,
    required DateTime dateTime,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .doc()
          .set({
        'name': name,
        'repNumber': repNumber,
        'setNumber': setNumber,
        'dateTime': dateTime,
      });
      await FirebaseFirestore.instance
          .collection('allWorkouts')
          .doc(user.uid)
          .collection('allWorkoutsData')
          .doc()
          .set({
        'name': name,
        'repNumber': repNumber,
        'setNumber': setNumber,
        'dateTime': dateTime,
      });
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future fetchAndSetWorkouts() async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      final workoutSnapshot = await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .get();
      final allWorkoutSnapshot = await FirebaseFirestore.instance
          .collection('allWorkouts')
          .doc(user.uid)
          .collection('allWorkoutsData')
          .get();
      final finishedworkoutSnapshot = await FirebaseFirestore.instance
          .collection('finishedWorkouts')
          .doc(user.uid)
          .collection('finishedWorkoutsData')
          .get();
      final heatMapSnapShot = await FirebaseFirestore.instance
          .collection('heatmap')
          .doc(user.uid)
          .collection('heatMapData')
          .get();

      final List<WorkoutModel> loadedWorkouts = [];
      final List<WorkoutModel> allworkoutsLoaded = [];
      final List<WorkoutModel> loadedFinishedWorkouts = [];
      final List<WorkoutModel> loadedHeatMapData = [];

      for (var doc in workoutSnapshot.docs) {
        final workoutData = doc.data();
        loadedWorkouts.add(
          WorkoutModel(
            id: doc.id,
            name: workoutData['name'],
            repNumber: workoutData['repNumber'],
            setNumber: workoutData['setNumber'],
            dateTime: (workoutData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }
      for (var doc in allWorkoutSnapshot.docs) {
        final allWorkoutData = doc.data();
        allworkoutsLoaded.add(
          WorkoutModel(
            id: doc.id,
            name: allWorkoutData['name'],
            repNumber: allWorkoutData['repNumber'],
            setNumber: allWorkoutData['setNumber'],
            dateTime: (allWorkoutData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }

      for (var doc in finishedworkoutSnapshot.docs) {
        final finishedWorkoutsData = doc.data();
        loadedFinishedWorkouts.add(
          WorkoutModel(
            id: doc.id,
            name: finishedWorkoutsData['name'],
            repNumber: finishedWorkoutsData['repNumber'],
            setNumber: finishedWorkoutsData['setNumber'],
            dateTime: (finishedWorkoutsData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }

      for (var doc in heatMapSnapShot.docs) {
        final heatMapData = doc.data();
        loadedHeatMapData.add(
          WorkoutModel(
            id: doc.id,
            name: heatMapData['name'],
            repNumber: heatMapData['repNumber'],
            setNumber: heatMapData['setNumber'],
            dateTime: (heatMapData['dateTime'] as Timestamp).toDate(),
          ),
        );
      }

      loadedWorkouts.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      _workouts.clear();
      _workouts.addAll(loadedWorkouts);
      _allWorkouts.clear();
      _allWorkouts.addAll(allworkoutsLoaded);
      _finishedWorkouts.clear();
      _finishedWorkouts.addAll(loadedFinishedWorkouts);
      _heatMapData.clear();
      _heatMapData.addAll(loadedHeatMapData);

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearWorkoutsIfDayChanges(DateTime lastDateTime) async {
    DateTime now = DateTime.now();

    if (isLastDateTimeDifferent(now, lastDateTime)) {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('workouts')
            .doc(user!.uid)
            .collection('workoutData')
            .get()
            .then((workoutSnapshot) {
          for (var doc in workoutSnapshot.docs) {
            DateTime workoutDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isWorkoutDateDifferent(now, workoutDateTime)) {
              doc.reference.delete();
            }
          }
        });
        await FirebaseFirestore.instance
            .collection('finishedWorkouts')
            .doc(user.uid)
            .collection('finishedWorkoutsData')
            .get()
            .then((finishedWorkoutSnapshot) {
          for (var doc in finishedWorkoutSnapshot.docs) {
            DateTime workoutDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isWorkoutDateDifferent(now, workoutDateTime)) {
              doc.reference.delete();
            }
          }
        });
        await FirebaseFirestore.instance
            .collection('allWorkouts')
            .doc(user.uid)
            .collection('allWorkoutsData')
            .get()
            .then((finishedWorkoutSnapshot) {
          for (var doc in finishedWorkoutSnapshot.docs) {
            DateTime workoutDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isWorkoutDateDifferent(now, workoutDateTime)) {
              doc.reference.delete();
            }
          }
        });

        await FirebaseFirestore.instance
            .collection('heatmap')
            .doc(user.uid)
            .collection('heatMapData')
            .get()
            .then((heatMapSnapShot) {
          for (var doc in heatMapSnapShot.docs) {
            DateTime heatMapDateTime = (doc['dateTime'] as Timestamp).toDate();
            if (isLastYearDifferent(now, heatMapDateTime)) {
              doc.reference.delete();
            }
          }
        });


      } catch (e) {
        rethrow;
      }
    }
  }

  bool isLastDateTimeDifferent(DateTime now, DateTime lastDateTime) {
    return now.year != lastDateTime.year ||
        now.month != lastDateTime.month ||
        now.day != lastDateTime.day;
  }

  bool isWorkoutDateDifferent(DateTime now, DateTime workoutDateTime) {
    return now.year != workoutDateTime.year ||
        now.month != workoutDateTime.month ||
        now.day != workoutDateTime.day;
  }

  bool isLastYearDifferent(DateTime now, DateTime lastDateTime) {
    return now.year != lastDateTime.year;
  }

  Future<void> deleteWorkout({required String workoutID}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('workouts')
          .doc(user!.uid)
          .collection('workoutData')
          .doc(workoutID)
          .delete();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAllWorkout({required String allWorkoutID}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('allWorkouts')
          .doc(user!.uid)
          .collection('allWorkoutsData')
          .doc(allWorkoutID)
          .delete();

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> finishWorkout({
    required String workoutID,
    required String name,
    required int repNumber,
    required int setNumber,
    required DateTime dateTime,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('finishedWorkouts')
          .doc(user!.uid)
          .collection('finishedWorkoutsData')
          .doc()
          .set({
        'name': name,
        'repNumber': repNumber,
        'setNumber': setNumber,
        'dateTime': dateTime,
        'id': workoutID,
      });

      await FirebaseFirestore.instance
          .collection('heatmap')
          .doc(user.uid)
          .collection('heatMapData')
          .doc()
          .set({
        'name': name,
        'repNumber': repNumber,
        'setNumber': setNumber,
        'dateTime': dateTime,
        'id': workoutID,
      });

      notifyListeners();
    } catch (e) {
      notifyListeners();
      rethrow;
    }
  }





  ///---Counter---///
  final int _count = 0;
  int get count => _count;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = 'Status not available';
  int _steps = 0;
  int savedStepCount = 0;
  int todayStepCount = 0;
  int savedTodayStepCount = 0;
  int lastDaySaved = 0;

  int get steps => _steps;
  String get status => _status;



  void onStepCount(StepCount event) {
    debugPrint('========>>>>>event$event');
    _steps = event.steps;
    calculateDistance();
    calculateCalories();
    _saveStepCount(event.steps);
    notifyListeners();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    if (kDebugMode) {
      print(event);
    }
    _status = event.status;
    notifyListeners();
  }

  void onPedestrianStatusError(error) {
    if (kDebugMode) {
      print('onPedestrianStatusError: $error');
    }
    _status = 'Pedestrian Status not available';
    if (kDebugMode) {
      print(_status);
    }
    notifyListeners();
  }

  void onStepCountError(error) {
    if (kDebugMode) {
      print('onStepCountError: $error');
    }
    _status = 'Step Count not available';
    notifyListeners();
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;

    if (!granted) {
      granted = await Permission.activityRecognition.request() ==
          PermissionStatus.granted;
    }

    return granted;
  }

  Future<void> initPlatformState(bool mounted) async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      /// tell user, the app will not work
    }
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    (_pedestrianStatusStream.listen(onPedestrianStatusChanged))
        .onError(onPedestrianStatusError);
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    if (!mounted) return;
  }

  void _saveStepCount(int value) async {
    savedStepCount = prefs.getInt(StringsManager.savedStepCount) ?? 0;
    lastDaySaved = prefs.getInt(StringsManager.lastDaySaved) ?? 0;

    // Check if the saved counter needs to be reset
    if (value < savedStepCount) {
      savedStepCount = 0;
      await prefs.setInt(StringsManager.savedStepCount, savedStepCount);
    }

    // Get today's day number
    int todayDayNo = DateTime.now().day;

    // Reset saved count if it's a new day
    if (lastDaySaved < todayDayNo) {
      lastDaySaved = todayDayNo;
      await prefs.setInt(StringsManager.lastDaySaved, lastDaySaved);
      savedStepCount = value;
      await prefs.setInt(StringsManager.savedStepCount, savedStepCount);
    }

    todayStepCount = value - savedStepCount;
    await prefs.setInt(StringsManager.savedTodayStepCount, todayStepCount);
  }

  double _distanceKm = 0.0;
  double _caloriesBurned = 0.0;

  void calculateDistance() {
    _distanceKm = (prefs.getInt(StringsManager.savedTodayStepCount) ?? 0 * 0.78) / 1000; // Convert meters to kilometers
    _distanceKm = double.parse(_distanceKm.toStringAsFixed(2));
  }

  void calculateCalories() {
    // Assuming 0.04 calories burned per step
    _caloriesBurned = (prefs.getInt(StringsManager.savedTodayStepCount) ?? 0) * 0.04; // Calculate calories burned in calories
    // Convert to kilocalories (kcal)
    double kcalBurned = _caloriesBurned / 1000;

    // Round to 2 decimal places
    _caloriesBurned = double.parse(kcalBurned.toStringAsFixed(2));
  }

  // void reset() {
  //   _steps = 0;
  //   _stepCountValue = "0";
  //   _distanceKm = 0.0;
  //   _caloriesBurned = 0.0;
  //   notifyListeners();
  // }

  // Getters
  double get distanceKm => _distanceKm;
  double get caloriesBurned => _caloriesBurned;
}
