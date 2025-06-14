String formateDatatime(int time) {
  if (time < 60) {
    return "${time} min";
  } else {
    return "${(time / 60).toStringAsFixed(2)} H";
  }
}
