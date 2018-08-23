struct tokenTraker{
    var position:Int
    var universalPosition:Int
}

struct Tokens{
    var token_one:tokenTraker
    var token_two:tokenTraker
    var token_three:tokenTraker
    var token_four:tokenTraker
}

struct player{
    var playerNumber:Int
    var tokens:Tokens
}
