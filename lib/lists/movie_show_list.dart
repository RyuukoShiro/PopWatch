
import 'package:flutter/cupertino.dart';
import 'package:popwatch/models/movie_show.dart';

class MovieShowList with ChangeNotifier{

  List<MoviesAndShow> movieshowList = [

    MoviesAndShow(title: 'Doctor Strange in the Multiverse of Madness', description:
    "Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, "
        "to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse."
        " They seek help from Wanda the Scarlet Witch, Wong and others.", runtime: "126 Minutes", company: "Marvel", genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=aWzlQ2N6qqg", poster: "https://upload.wikimedia.org/wikipedia/en/1/17/Doctor_Strange_in_the_Multiverse_of_Madness_poster.jpg",
        cover: "https://www.themarysue.com/wp-content/uploads/2022/05/doctor-strange-multiverse-poster.jpeg",
        type: "Movie"),
    MoviesAndShow(title: "Jurassic World: Dominion", description: "Four years after the destruction of Isla Nublar, dinosaurs now live and hunt alongside humans all over the world."
        " This fragile balance will reshape the future and determine, once and for all, "
        "whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
        runtime: "147 minutes", company: "Universal Pictures", genre: "Action/Adventure", trailer: "https://www.youtube.com/watch?v=fb5ELWi-ekk",
        poster: "https://upload.wikimedia.org/wikipedia/en/c/ce/JurassicWorldDominion_Poster.jpeg", cover: "https://www.joblo.com/wp-content/uploads/2022/04/jurassic-world-dominion-empire.jpg",
        type: "Movie"),
    MoviesAndShow(title: "Obi-Wan Kenobi", description: "The Jedi Master contends with the consequences of his greatest defeat -- the downfall and corruption of his one-time friend and apprentice, Anakin Skywalker, who turned to the dark side as evil Sith Lord Darth Vader.",
        runtime: "6 Episodes", company: "Lucasfilm", genre: "Action/Adventure/Sci-Fi", trailer: "https://www.youtube.com/watch?v=3Yh_6_zItPU",
        poster: "https://sportshub.cbsistatic.com/i/2022/05/04/99c9c622-9857-49af-8b08-903805812d4f/image.png?auto=webp&width=1383&height=2048&crop=0.675:1,smart", cover: "https://i0.wp.com/thefutureoftheforce.com/wp-content/uploads/2022/05/Obi-Wan-Kenobi-Disney-Plus-Keyart-Header.jpg?fit=1932%2C1092&ssl=1",
        type: "Show"),
    MoviesAndShow(title: "Spiderman No Way Home", description: "Peter Parker seeks Doctor Strange's help to make people forget about Spiderman's identity. However, when the spell he casts gets corrupted, several unwanted guests enter their universe.",
        runtime: "148 minutes", company: "Marvel", genre: "Action/Adventure", trailer: "https://www.youtube.com/watch?v=JfVOs4VSpmA",
        poster: "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg", cover: "https://static1.srcdn.com/wordpress/wp-content/uploads/2022/03/Spider-Man-No-Way-Home-trio-shot.jpg",
        type: "Movie"),
    MoviesAndShow(title: "Your Name", description: "Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.",
        runtime: "107 minutes", company: "CoMix Wave Films", genre: "Romance/Fantasy", trailer: "https://www.youtube.com/watch?v=xU47nhruN-Q",
        poster: "https://m.media-amazon.com/images/M/MV5BNGYyNmI3M2YtNzYzZS00OTViLTkxYjAtZDIyZmE1Y2U1ZmQ2XkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg", cover: "https://connectedarts.files.wordpress.com/2017/04/tasokare-doki.png",
        type: "Movie"),
    MoviesAndShow(title: "Top Gun: Maverick", description: "After more than 30 years of service as one of the Navy's top aviators, Pete Maverick Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him. Training a detachment of graduates for a special assignment, Maverick must confront the ghosts of his past and his deepest fears, culminating in a mission that demands the ultimate sacrifice from those who choose to fly it.",
        runtime: "131 minutes", company: " Paramount Pictures Studios", genre: "Action/Adventure", trailer: "https://www.youtube.com/watch?v=giXco2jaZ_4",
        poster: "https://upload.wikimedia.org/wikipedia/en/1/13/Top_Gun_Maverick_Poster.jpg", cover: "https://theaviationist.com/wp-content/uploads/2022/05/Top-Gun-Maverick-movie-top-678x381.jpeg",
        type: "Movie"),
    MoviesAndShow(title: "Spy x Family", description: "Spy × Family is a Japanese manga series written and illustrated by Tatsuya Endo. The story follows a spy who has to build a family to execute a mission, not realizing that the girl he adopts as his daughter is a telepath, and the woman he agrees to be in a marriage with is a skilled assassin. ",
        runtime: "12 Episodes", company: "Wit Studio", genre: "Action/Comedy", trailer: "https://www.youtube.com/watch?v=Oqd2C3oZkBU",
        poster: "https://static.wikia.nocookie.net/spy-x-family9171/images/7/76/SPY_x_FAMILY_Key_Visual_1.png/revision/latest?cb=20211031171232", cover: "https://www.denofgeek.com/wp-content/uploads/2022/04/SPY-x-FAMILY-KV.jpg?fit=1200%2C675",
        type: "Show"),
  ];


  void addMoviesShows(title, description, runtime, company, genre,
      trailer, poster, cover, type) {
    movieshowList.insert(0,
        MoviesAndShow(
          title: title,
          description: description,
          runtime: runtime,
          company: company,
          genre: genre,
          trailer: trailer,
          poster: poster,
          cover: cover,
          type: type,
        ));
    notifyListeners();
  }

  List<MoviesAndShow>  getMoviesShows(){
    return movieshowList;
  }


  String searchString = "";
}