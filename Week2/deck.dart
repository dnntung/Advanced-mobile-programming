void main() {
  var deck = new Deck();

  print(deck);
}

class Deck {
  // Init empty list
  List<Card> cards = [];

  Deck() {
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];

    for (var rank in ranks){
      for (var suit in suits) {
        cards.add(new Card(rank: rank, suit: suit));
      }
    }
  }
  
  String toString() {
    return cards.toString();
  }
}

class Card {
  // Init null-safe value
  String? suit;
  String? rank;

  Card({this.suit, this.rank});
  
  String toString() {
    return '$rank of $suit';
  }
}
