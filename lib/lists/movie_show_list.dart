import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:popwatch/models/movie_show.dart';

class MovieShowProvider with ChangeNotifier {
  //
  List<MoviesAndShow> movieshowList = [
    // Get data from the list
    MoviesAndShow(
        id: '0',
        title: 'Doctor Strange in the Multiverse of Madness',
        description:
            "Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, "
            "to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse."
            " They seek help from Wanda the Scarlet Witch, Wong and others.",
        runtime: "126 Minutes",
        company: "Marvel",
        genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=aWzlQ2N6qqg",
        poster:
            "https://upload.wikimedia.org/wikipedia/en/1/17/Doctor_Strange_in_the_Multiverse_of_Madness_poster.jpg",
        cover:
            "https://www.themarysue.com/wp-content/uploads/2022/05/doctor-strange-multiverse-poster.jpeg",
        type: "Movie"),
    MoviesAndShow(
        id: '1',
        title: "Jurassic World: Dominion",
        description:
            "Four years after the destruction of Isla Nublar, dinosaurs now live and hunt alongside humans all over the world."
            " This fragile balance will reshape the future and determine, once and for all, "
            "whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
        runtime: "147 minutes",
        company: "Universal Pictures",
        genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=fb5ELWi-ekk",
        poster:
            "https://upload.wikimedia.org/wikipedia/en/c/ce/JurassicWorldDominion_Poster.jpeg",
        cover:
            "https://www.joblo.com/wp-content/uploads/2022/04/jurassic-world-dominion-empire.jpg",
        type: "Movie"),
    MoviesAndShow(
        id: '2',
        title: "Obi-Wan Kenobi",
        description:
            "The Jedi Master contends with the consequences of his greatest defeat -- the downfall and corruption of his one-time friend and apprentice, Anakin Skywalker, who turned to the dark side as evil Sith Lord Darth Vader.",
        runtime: "6 Episodes",
        company: "Lucasfilm",
        genre: "Action/Adventure/Sci-Fi",
        trailer: "https://www.youtube.com/watch?v=3Yh_6_zItPU",
        poster:
            "https://sportshub.cbsistatic.com/i/2022/05/04/99c9c622-9857-49af-8b08-903805812d4f/image.png?auto=webp&width=1383&height=2048&crop=0.675:1,smart",
        cover:
            "https://i0.wp.com/thefutureoftheforce.com/wp-content/uploads/2022/05/Obi-Wan-Kenobi-Disney-Plus-Keyart-Header.jpg?fit=1932%2C1092&ssl=1",
        type: "Show"),
    MoviesAndShow(
        id: '3',
        title: "Vincenzo",
        description:
            "During a visit to his motherland, a Korean-Italian mafia lawyer gives a conglomerate a taste of its own medicine with a side of justice.",
        runtime: "20 Episodes",
        company: "Logos Film",
        genre: "Action/Comedy",
        trailer: "https://www.youtube.com/watch?v=S12-4mXCNj4",
        poster:
            "https://static.wikia.nocookie.net/netflix/images/2/2c/Vincenzo.jpg/revision/latest/top-crop/width/360/height/450?cb=20210220154602",
        cover:
            "https://www.traveltheworldwith.us/wp-content/uploads/2021/06/Vincenzo-K-Drama-Main-Characters-Poster.jpg",
        type: "Show"),
    MoviesAndShow(
        id: '4',
        title: "Spiderman No Way Home",
        description:
            "Peter Parker seeks Doctor Strange's help to make people forget about Spiderman's identity. However, when the spell he casts gets corrupted, several unwanted guests enter their universe.",
        runtime: "148 minutes",
        company: "Marvel",
        genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=JfVOs4VSpmA",
        poster:
            "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg",
        cover:
            "https://static1.srcdn.com/wordpress/wp-content/uploads/2022/03/Spider-Man-No-Way-Home-trio-shot.jpg",
        type: "Movie"),
    MoviesAndShow(
        id: '5',
        title: "The Boys",
        description:
            "Superheroes are often as popular as celebrities, as influential as politicians, and sometimes even as revered as gods. But that's when they're using their powers for good. What happens when the heroes go rogue and start abusing their powers? When it's the powerless against the super powerful, the Boys head out on a heroic quest to expose the truth about the Seven and Vought, the multibillion-dollar conglomerate that manages the superheroes and covers up their dirty secrets. Based on the comic book series of the same name.",
        runtime: "3 Seasons, 22 Episodes",
        company: "Sony Pictures",
        genre: "Action/Comedy",
        trailer: "https://www.youtube.com/watch?v=K-8VYKUZYiw",
        poster:
            "https://resizing.flixster.com/oynbxA9hJYlfdYfqcy_BrVNu_cQ=/ems.cHJkLWVtcy1hc3NldHMvdHZzZWFzb24vUlRUVjczNzIyNC53ZWJw",
        cover:
            "https://www.begeek.fr/wp-content/uploads/2022/05/The-Boys-saison-3-Amazon-Prime-Video.jpg",
        type: "Show"),
    MoviesAndShow(
        id: '6',
        title: "Your Name",
        description:
            "Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.",
        runtime: "107 minutes",
        company: "CoMix Wave Films",
        genre: "Romance/Fantasy",
        trailer: "https://www.youtube.com/watch?v=xU47nhruN-Q",
        poster:
            "https://m.media-amazon.com/images/M/MV5BNGYyNmI3M2YtNzYzZS00OTViLTkxYjAtZDIyZmE1Y2U1ZmQ2XkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg",
        cover:
            "https://connectedarts.files.wordpress.com/2017/04/tasokare-doki.png",
        type: "Movie"),
    MoviesAndShow(
        id: '7',
        title: "Top Gun: Maverick",
        description:
            "After more than 30 years of service as one of the Navy's top aviators, Pete Maverick Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him. Training a detachment of graduates for a special assignment, Maverick must confront the ghosts of his past and his deepest fears, culminating in a mission that demands the ultimate sacrifice from those who choose to fly it.",
        runtime: "131 minutes",
        company: " Paramount Pictures Studios",
        genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=giXco2jaZ_4",
        poster:
            "https://upload.wikimedia.org/wikipedia/en/1/13/Top_Gun_Maverick_Poster.jpg",
        cover:
            "https://theaviationist.com/wp-content/uploads/2022/05/Top-Gun-Maverick-movie-top-678x381.jpeg",
        type: "Movie"),
    MoviesAndShow(
        id: '7',
        title: "Demon Slayer (Kimetsu No Yaiba)",
        description:
            "A youth begins a quest to fight demons and save his sister after finding his family slaughtered and his sister turned into a demon.",
        runtime: "2 Seasons, 44 Episodes",
        company: "UfoTable",
        genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=VQGCKyvzIM4",
        poster:
            "https://anitrendz.net/news/wp-content/uploads/2019/04/Demon-Slayer-Kimetsu-no-Yaiba-Official-Poster.png",
        cover:
            "https://marketresearchtelecast.com/wp-content/uploads/2021/06/1624338107_Demon-Slayer-Kimetsu-no-Yaiba-presents-its-final-cover-art.jpg",
        type: "Show"),
    MoviesAndShow(
        id: '8',
        title: "Demon Slayer (Kimetsu No Yaiba) Mugen Train",
        description:
            "Falling forever into an endless dream… Tanjiro and the group have completed their rehabilitation training at the Butterfly Mansion, and they arrive to their next mission on the Mugen Train, where over 40 people have disappeared in a very short period of time. Tanjiro and Nezuko, along with Zenitsu and Inosuke, join one of the most powerful swordsmen within the Demon Slayer Corps, Flame Hashira Kyojuro Rengoku, to face the demon aboard the Mugen Train on track to despair.",
        runtime: "116 Minutes",
        company: "Ufotable",
        genre: "Action/Adventure",
        trailer: "https://www.youtube.com/watch?v=bFwdl2PDAFM",
        poster:
            "https://www.posterhub.com.sg/images/detailed/117/received_154655369541568.jpeg",
        cover:
            "https://i0.wp.com/anitrendz.net/news/wp-content/uploads/2021/09/demonslayermugentraintvversionvisual-1-e1632582408736.jpg",
        type: "Movie"),
    MoviesAndShow(
        id: '9',
        title: "Spy x Family",
        description:
            "Spy × Family is a Japanese manga series written and illustrated by Tatsuya Endo. The story follows a spy who has to build a family to execute a mission, not realizing that the girl he adopts as his daughter is a telepath, and the woman he agrees to be in a marriage with is a skilled assassin. ",
        runtime: "12 Episodes",
        company: "Wit Studio",
        genre: "Action/Comedy",
        trailer: "https://www.youtube.com/watch?v=Oqd2C3oZkBU",
        poster:
            "https://static.wikia.nocookie.net/spy-x-family9171/images/7/76/SPY_x_FAMILY_Key_Visual_1.png/revision/latest?cb=20211031171232",
        cover:
            "https://www.denofgeek.com/wp-content/uploads/2022/04/SPY-x-FAMILY-KV.jpg?fit=1200%2C675",
        type: "Show"),
  ];

  //Function calls addMovieShows to add any movies on the add movie screen.
  void addMoviesShows(id, title, description, runtime, company, genre, trailer,
      poster, cover, type) {
    movieshowList.insert(
        0,
        MoviesAndShow(
          id: id,
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

  List<MoviesAndShow> getMoviesShows() {
    return movieshowList;
  }

// searchString is for the search on the list_screen
  String searchString = "";

  List<MoviesAndShow> MoviesShowsList = [];

  MovieShowProvider() {
    FirebaseFirestore.instance.collection('media').snapshots().listen(
      (event) {
        for (var change in event.docChanges) {
          MoviesAndShow movieshow =
              MoviesAndShow.fromMap(change.doc.data()!, change.doc.id);
          switch (change.type) {
            case DocumentChangeType.added:
              MoviesShowsList.add(movieshow);
              break;
            case DocumentChangeType.modified:
              MoviesShowsList.removeWhere(
                  (element) => element.id == movieshow.id);
              MoviesShowsList.add(movieshow);
              break;
            case DocumentChangeType.removed:
              MoviesShowsList.removeWhere(
                  (element) => element.id == movieshow.id);
              break;
          }
          notifyListeners();
        }
      },
    );
  }
}
