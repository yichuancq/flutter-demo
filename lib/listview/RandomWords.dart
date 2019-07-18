import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _words = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  Widget _buildWords() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final isSaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Startup Name Generator"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.list),
              onPressed: () {
                // 实现页面跳转的函数
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new SavedPage(saved: _saved, biggerFont: _biggerFont);
                }));
              },
            )
          ]),
      body: _buildWords(),
    );
  }
}

// 实现已保存数据的页面
class SavedPage extends StatelessWidget {
  // 声明类的参数
  SavedPage({@required this.saved, @required this.biggerFont});

  final Set<WordPair> saved;
  final TextStyle biggerFont;

  // 渲染一个列表
  @override
  Widget build(BuildContext context) {
    final divided = ListTile.divideTiles(
      context: context,
      tiles: saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: biggerFont,
          ),
        );
      }),
    ).toList();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Saved Words"),
      ),
      body: new ListView(children: divided),
    );
  }
}
