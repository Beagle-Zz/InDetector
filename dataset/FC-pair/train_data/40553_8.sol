contract c40553{
     
     
    function config(uint new_max_round, uint new_min_round, uint new_information_cost, uint new_gamble_value)
	    onlyOwner
	    onlyInactive noEthSent{
	    if (new_max_round<new_min_round) throw;
	    if (new_information_cost > new_gamble_value/100) throw;
	    round_max_size = new_max_round;
	    round_min_size = new_min_round;
	    information_cost= new_information_cost;
	    gamble_value = new_gamble_value;
    }
}