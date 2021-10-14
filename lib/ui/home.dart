import 'package:flutter/material.dart';
import 'package:myprojects/model/movie.dart';
import 'package:myprojects/model/questions.dart';

import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movielist = Movie.getMovies();

  // final List movies = [
  //   'avatar',
  //   'End game',
  //   'Spider man',
  //   'Black Panther',
  //   'King of Boys'
  //       'avatar',
  //   'Aqua man',
  //   'Spider man',
  //   'Game of throne',
  //   'Titanic'
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie List'),
          backgroundColor: Colors.grey.shade900,
        ),
        backgroundColor: Colors.grey.shade900,
        body: ListView.builder(
          itemCount: movielist.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              movieCard(movielist[index], context),
              Positioned(
                top: 10,
                child: movieImage(movielist[index].images[0]),
              ),
            ]);
            // return Card(
            //   elevation: 3,
            //   color: Colors.white,
            //   child: ListTile(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(
            //                     // moviename: movielist[index].director, movie:movielist[index] ,
            //                     movie: movielist[index],
            //                   )));
            // //     },
            //     //onTap: ()=> debugPrint( 'movie name: ${movies[index]}'),
            //     leading: CircleAvatar(
            //       child: Container(
            //         height: 200,
            //         width: 200,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //           image: NetworkImage(movielist[index].images[0]),
            //           fit: BoxFit.cover,
            //         )),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text(
            //       '...',
            //       style: TextStyle(fontSize: 30),
            //     ),
            //     title: Text(movielist[index].title),
            //     subtitle: Text('${movielist[index].director}'),
            //   ),
            // );
          },
        ));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      // moviename: movie.title, movie:movielist[index] ,
                      movie: movie,
                    )))
      },
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                      ),
                      Text('Rating: ${movie.rated} / 10',
                          style: mainTextStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Released: ${movie.year}', style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey);
  }

  Widget movieImage(String imageurl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageurl ??
                  'https://images.unsplash.com/photo-1628359122201-e84153b15456?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8aG1lbnZRaFVteE18fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              fit: BoxFit.cover)),
    );
  }
}

//New Route
class MovieListViewDetails extends StatelessWidget {
  final String moviename;
  final Movie movie;

  const MovieListViewDetails({Key key, this.moviename, this.movie})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Movies'),
      ),

      body: ListView(
        children: [
          MovieDetailsThumbnails(
            thumbnail: movie.images[2],
          ),
          MovieDetailsHeaderWitPoster(
            movie: movie,
          ),
          HorizontalLine(),
          MovieDetailsCast(
            movie: movie,
          ),
          HorizontalLine(),
          MovieExtraPosters(posters: movie.images)
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         //child: Text('Go back $moviename')),
      //         child: Text('Go back ${movie.director}')),
      //   ),
      // ),
    );
  }
}



class QuizApp extends StatefulWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question(questionText: 'american can also be called us,', isCorrect: true),
    Question(questionText: 'British Colonized Nigeria', isCorrect: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('True citizens'),
        centerTitle: true,
       // backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  'assets/images/americanflag.png',
                  width: 250,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    )),
                height: 120.0,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    questionBank[_currentQuestionIndex % questionBank.length]
                        .questionText,
                    //style: TextStyle(fontSize: 16.9, color: Colors.white),
                  ),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _prevQuestion();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () {
                    _checkAnswer(true);
                  },
                  child: Text('TRUE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _checkAnswer(false);
                  },
                  child: Text('FALSE'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _nextQuestion();
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //correct anser

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text('you are correct.'),
      ));
      _updateQuestion();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text('Ooopsss you are wrong'),
      ));
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  void _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.purpleAccent.shade100),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total per person',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        ' \$ ${calculateTotalPerPerson(
                          _billAmount,
                          _personCounter,
                          _tipPercentage,
                        )}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  )),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        prefixText: 'Bill amount',
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SPLIT',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          )),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.purple.withOpacity(0.2)),
                              child: Center(
                                  child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                            ),
                          ),
                          Text(
                            '$_personCounter',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.purple.withOpacity(0.2)),
                              child: Center(
                                  child: Text(
                                '+',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //Tipssssss
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tip',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          ' \$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage).toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),

                  //slider
                  Column(
                    children: [
                      Text(
                        '$_tipPercentage %',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    // var totalTip = calculateTotalTip(billAmount,splitBy, tipPercentage);
    // var totalPerPerson = ( totalTip + billAmount) / splitBy;
    //or
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  List quotes = [
    'A cutting word is worse than a bowstring, a cut may heal, but the cut of the tongue does not',
    'There are no shortcuts to the top of the palm tree. African Proverb',
    'For tomorrow belongs to the people who prepare for it today.',
    'Knowledge without wisdom is like water in the sand',
    'If you offend, ask for a pardon; if offended forgive',
    'A person with too much ambition cannot sleep in peace',
    'Even the best dancer on the stage must retire sometime',
    'Even the best dancer on the stage must retire sometime',
    'The laughter of a child lights up the house.',
    'He who refuses to obey cannot command',
    'Seeing is different than being told',
    'Rising early makes the road short',
    'By crawling a child learns to stand',
    'A quarrelsome chief does not hold a village together.',
    'if you are not part of the solution, then you are part of the problem',
    'Beware how you take away hope from another human being.',
    'Beware of all enterprises that require new clothes.',
    'Beware of false knowledge; it is more dangerous than ignorance.',
    'Beware of little expenses. A small leak will sink a great ship.',
    'Beware of the man who works hard to learn something, learns it, and finds himself no wiser than before. He is full of murderous resentment of people who are ignorant without having come by their ignorance the hard way.',
    'Beware the writer who always encloses the word reality in quotation marks: He is trying to slip something over on you. Or into you.',
    'Big business never pays a nickel in taxes, according to Ralph Nader, who represents a big consumer organization that never pays a nickel in taxes.',
    'Big shots are only little shots who keep shooting.',
    'Black holes are where God divided by zero.',
    'Blessed are the forgetful: for they get the better even of their blunders.',
    'Blessed is the man, who having nothing to say, abstains from giving wordy evidence of the fact.',
    'Blood is the ink of our lifes story.',
    'Bodily exercise, when compulsory, does no harm to the body; but knowledge which is acquired under compulsion obtains no hold on the mind.',
    'Boldness be my friend.',
    'Books serve to show a man that those original thoughts of his are not very new at all.',
    'Boredom is a vital problem for the moralist, since at least half the sins of mankind are caused by the fear of it.',
    'Both oligarch and tyrant mistrust the people, and therefore deprive them of their arms.',
    'Both tears and sweat are salty, but they render a different result. Tears will get you sympathy; sweat will get you change.',
    'Boxing is just show business with blood.',
    'Boy, those French, they have a different word for everything!',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 800,
          width: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.transparent,
          ),
          // alignment: Alignment.center,

          //alignment: Alignment.center,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  quotes[_index % quotes.length],
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
              Divider(
                thickness: 1.5,
                indent: 0,
                color: Colors.greenAccent,
              ),
              TextButton.icon(
                onPressed: _showQuote,
                icon: Icon(Icons.wb_sunny),
                label: Text('Inspire me'),
              ),
              // Spacer(),// for pushing thing either up or down
            ],
          ),
        ),
      ),
    );
  }

  int _index = 0;
  _showQuote() {
    setState(() {
      _index++;
    });
    //increment our counter by 1
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biz Card'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      margin: EdgeInsets.all(50),
      width: 350,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(14.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Udechukwu Blessed',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'udechukwublessed@gmail.com',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              Text('facebook.com/ Udechukwu Blessed'),
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: Colors.redAccent, width: 1.8),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        image: DecorationImage(
            image: NetworkImage('https://picsum.photos/300/300'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: CustomButton(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.email),
            label: 'Email',
          ),
        ],
        onTap: (int index) => debugPrint('Tapped item : $index'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.call_missed),
        onPressed: () {},
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(
          content: Text('Hello I am a snackbar'),
          backgroundColor: Colors.redAccent,
        );
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          // color: Colors.indigo,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('button'),
      ),
    );
  }
}
