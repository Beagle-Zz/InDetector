contract c40546{
     
    function refundRound() 
    onlyActive
    onlyOwner noEthSent{  
        uint totalRefund;
	uint balanceBeforeRefund=this.balance;
        for (var k = 0;  k< matchers.length; k++) {
	            matchers[k].player.send(gamble_value);
		    totalRefund+=gamble_value;
        }
        for (var j = 0;  j< contrarians.length ; j++) {	
	            contrarians[j].player.send(gamble_value);
		    totalRefund+=gamble_value;		    
        }
	delete matchers;
	delete contrarians;
	state=State.Deactivated;
	index_player_in_round=0;
        uint balanceLeft = balanceBeforeRefund-totalRefund;
	if (balanceLeft >0) owner.send(balanceLeft);
    }
}