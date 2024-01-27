contract c40548{
     
    function endRound() private {
        delete results;
        uint256 random_start_contrarian = randomGen(index_player,(index_player_in_round)/2)-1;
        uint256 payout_total;
        for (var k = 0; k < (index_player_in_round)/2; k++) {
            uint256 index_contrarian;
	    if (k+random_start_contrarian<(index_player_in_round)/2){
	        index_contrarian=k+random_start_contrarian;
            }
	    else{
	        index_contrarian=(k+random_start_contrarian)-(index_player_in_round/2);
	    }
	    uint256 information_cost_matcher = information_cost * k;
	    uint256 payout_matcher = 2*(gamble_value-information_cost_matcher);
	    uint256 information_cost_contrarian = information_cost * index_contrarian;
	    uint256 payout_contrarian = 2*(gamble_value-information_cost_contrarian);
	    results.push(Result(matchers[k].player,matchers[k].flipped,payout_matcher,contrarians[index_contrarian].player,contrarians[index_contrarian].flipped, payout_contrarian));
	    if (matchers[k].flipped == contrarians[index_contrarian].flipped) {
	        matchers[k].player.send(payout_matcher);
		payout_total+=payout_matcher;
		payout_history[matchers[k].player]+=payout_matcher;
	    }
	    else {
	        contrarians[index_contrarian].player.send(payout_contrarian);
		payout_total+=payout_contrarian;
		payout_history[contrarians[k].player]+=payout_contrarian;
	    }
	}
        index_round_ended+=1;
        owner.send(index_player_in_round*gamble_value-payout_total);
	payout_total=0;
        index_player_in_round=0;
        delete matchers;
        delete contrarians;
	pendingRound=false;
	if (terminate_after_round==true) state=State.Deactivated;
    }
}