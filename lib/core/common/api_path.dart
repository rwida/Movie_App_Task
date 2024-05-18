class AppApiPaths {
  ///
  static const String _url = 'https://api.themoviedb.org/3';

  // get Movies Type List
  static const String getMoviesTypeList = '$_url/genre/movie/list';

  // get Movies List
  static const String getMoviesList = '$_url/movie';

  // get Movie Details
  static const String getMovieDetails = '$_url/movie';
}
