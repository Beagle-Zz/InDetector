contract c2529{
    //get amount of active bet tokens
    function _totalActiveBets() private view returns(uint total) {
        total = 0;
        for(uint i=0; i<betBanks.length; i++) {//loop through bets 
            if(betBanks[i].bet != emptyBet && betBanks[i].owner != msg.sender) {//if there is a bet and the owner is not the msg.sender
                total++;//increase quantity
            }
        }
    }
}