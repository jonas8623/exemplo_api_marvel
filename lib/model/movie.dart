
class Movie {
  int? id;
  String? title;
  String? releaseDate;
  String? boxOffice;
  int? duration;
  String? overview;
  String? coverUrl;
  String? trailerUrl;
  String? directedBy;
  int? phase;
  String? saga;
  int? chronology;
  int? postCreditScenes;
  String? imdbId;

  Movie(
      {this.id,
        this.title,
        this.releaseDate,
        this.boxOffice,
        this.duration,
        this.overview,
        this.coverUrl,
        this.trailerUrl,
        this.directedBy,
        this.phase,
        this.saga,
        this.chronology,
        this.postCreditScenes,
        this.imdbId});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    releaseDate = json['release_date'];
    boxOffice = json['box_office'];
    duration = json['duration'];
    overview = json['overview'];
    coverUrl = json['cover_url'];
    trailerUrl = json['trailer_url'];
    directedBy = json['directed_by'];
    phase = json['phase'];
    saga = json['saga'];
    chronology = json['chronology'];
    postCreditScenes = json['post_credit_scenes'];
    imdbId = json['imdb_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['release_date'] = releaseDate;
    data['box_office'] = boxOffice;
    data['duration'] = duration;
    data['overview'] = overview;
    data['cover_url'] = coverUrl;
    data['trailer_url'] = trailerUrl;
    data['directed_by'] = directedBy;
    data['phase'] = phase;
    data['saga'] = saga;
    data['chronology'] = chronology;
    data['post_credit_scenes'] = postCreditScenes;
    data['imdb_id'] = imdbId;
    return data;
  }
}

/*
  [

    {
      "id": 1,
      "title": "Iron Man",
      "release_date": "2008-05-02",
      "box_office": "585171547",
      "duration": 126,
      "overview": "2008's Iron Man tells the story of Tony Stark, a billionaire industrialist and genius inventor who is kidnapped and forced to build a devastating weapon. Instead, using his intelligence and ingenuity, Tony builds a high-tech suit of armor and escapes captivity. When he uncovers a nefarious plot with global implications, he dons his powerful armor and vows to protect the world as Iron Man.",
      "cover_url": "https://raw.githubusercontent.com/AugustoMarcelo/mcuapi/master/covers/iron-man.jpg",
      "trailer_url": "http://players.brightcove.net/5359769168001/BJemW31x6g_default/index.html?videoId=5786306590001",
      "directed_by": "Jon Favreau",
      "phase": 1,
      "saga": "Infinity Saga",
      "chronology": 3,
      "post_credit_scenes": 1,
      "imdb_id": "tt0371746"
    }

  ]
 */