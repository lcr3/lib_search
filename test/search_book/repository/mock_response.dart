import 'package:lib_search_app/network/entity/book.dart';

class MockSearchBookJson {
  final mockResponse = '''
    {
      "Items":
        [
          {
            "Item":{
              "limitedFlag":0,
              "authorKana":"デビッド スコット バーンスタイン/ヨシバ リュウタロウ",
              "author":"David Scott Bernstein/吉羽龍太郎",
              "subTitle":"ソフトウェアの寿命を延ばし価値を高める9つのプラクティス",
              "seriesNameKana":"",
              "title":"レガシーコードからの脱却",
              "subTitleKana":"ソフトウェアノジュミョウヲノバシカチヲタカメルココノツノプラクティス",
              "itemCaption":"レガシーコードとは、バグを多く含み、壊れやすく拡張が難しいコードを指します。このようなコードの保守と管理には多大な労力がつぎ込まれることになります。しかも一度作ってしまったレガシーコードの質を上げるには、初めから質の高いコードを作るよりも膨大なコストがかかります。本書では、ソフトウェア開発において、初めからレガシーコードを作りださないためのプラクティスを９つ挙げて解説します。プロダクトオーナーは目的を語り、やり方は開発者に任せること、小さなバッチで開発を進めること、継続的に統合すること、チームメンバーで協力することなど、日々の開発に取り入れる考え方と具体的な実践について各章で分かりやすく解説します。信頼性や拡張性が高いソフトウェアをリリースしたい開発者、運用管理者、マネージャに必携の一冊です。",
              "publisherName":"オライリージャパン",
              "listPrice":0,
              "isbn":"9784873118864",
              "largeImageUrl":"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8864/9784873118864.jpg?_ex=200x200",
              "mediumImageUrl":"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8864/9784873118864.jpg?_ex=120x120",
              "titleKana":"レガシーコードカラノダッキャク",
              "availability":"1",
              "postageFlag":2,
              "salesDate":"2019年09月19日頃",
              "contents":"",
              "smallImageUrl":"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8864/9784873118864.jpg?_ex=64x64",
              "discountPrice":0,
              "itemPrice":3190,
              "size":"単行本",
              "booksGenreId":"001005005011/001005017",
              "affiliateUrl":"",
              "seriesName":"",
              "reviewCount":33,
              "reviewAverage":"4.31",
              "discountRate":0,
              "chirayomiUrl":"",
              "itemUrl":"https://books.rakuten.co.jp/rb/16014151/"}
            },
          {
            "Item":{
              "limitedFlag":0,
              "authorKana":"フェザーズ,マイケル・C./ウルシステムズ カブシキ ガイシャ",
              "author":"マイケル・C．フェザーズ/ウルシステムズ株式会社",
              "subTitle":"保守開発のためのリファクタリング",
              "seriesNameKana":"オブジェクト オリエンテッド セレクション",
              "title":"レガシーコード改善ガイド",
              "subTitleKana":"ホシュ カイハツ ノ タメノ リファクタリング",
              "itemCaption":"システム保守の現場でありがちな、構造が複雑で理解できないようなコードに対する分析手法・対処方法について解説。コードを理解し、テストできるようにし、リファクタリングを可能にし、機能を追加できるテクニックを紹介。",
              "publisherName":"翔泳社",
              "listPrice":0,
              "isbn":"9784798116839",
              "largeImageUrl":"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6839/9784798116839.jpg?_ex=200x200",
              "mediumImageUrl":"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6839/9784798116839.jpg?_ex=120x120",
              "titleKana":"レガシー コード カイゼン ガイド",
              "availability":"1",
              "postageFlag":2,
              "salesDate":"2009年07月",
              "contents":"",
              "smallImageUrl":"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6839/9784798116839.jpg?_ex=64x64",
              "discountPrice":0,
              "itemPrice":4620,
              "size":"単行本",
              "booksGenreId":"001005017",
              "affiliateUrl":"",
              "seriesName":"Object　oriented　selection","reviewCount":32,
              "reviewAverage":"4.0",
              "discountRate":0,
              "chirayomiUrl":"",
              "itemUrl":"https://books.rakuten.co.jp/rb/6121689/"
            }
          }
        ],
      "pageCount":1,
      "hits":2,
      "last":2,
      "count":2,
      "page":1,
      "carrier":0,
      "GenreInformation":[],
      "first":1
    }
  ''';

  final mockBooks = [
    Book(
        title: 'レガシーコードからの脱却',
        author: 'David Scott Bernstein/吉羽龍太郎',
        isbn: '9784873118864',
        largeImageUrl: 'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8864/9784873118864.jpg?_ex=200x200'),
    Book(
        title: 'レガシーコード改善ガイド',
        author: 'マイケル・C．フェザーズ/ウルシステムズ株式会社',
        isbn: '9784798116839',
        largeImageUrl: 'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6839/9784798116839.jpg?_ex=200x200'),
  ];
}
