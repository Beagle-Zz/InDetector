contract c40548{
     
    function Play(bool flipped) equalGambleValue onlyActive resolvePendingRound{
        if ( index_player_in_round%2==0 ) {    
	    matchers.push(Gamble(msg.sender, flipped));
	}
	else {
	    contrarians.push(Gamble(msg.sender, flipped));
	}
        index_player+=1;
        index_player_in_round+=1;
	times_played_history[msg.sender]+=1;
        if (index_player_in_round>=round_min_size && index_player_in_round%2==0) {
	            bool end = randomEnd();
		    if (end) {
		        pendingRound=true;
			blockEndRound=block.number;}
        }
    }
}