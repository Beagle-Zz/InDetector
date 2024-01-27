contract c40466{
      
     function solveBet(address player, uint8 result, bool win, uint8 multiplier) private
     {
        playerStatus[msg.sender]=Status.waitingForBet;
        gambles[gambleIndex[player]].spinned=true;
	uint bet_v = gambles[gambleIndex[player]].wager;
            if (win)
            {
		  gambles[gambleIndex[player]].win=true;
		  uint win_v = multiplier*bet_v;
                  player.send(win_v);
                  lossSinceChange+=win_v-bet_v;
		  Win(player, result, win_v);
             }
            else
            {
		Loss(player, result, bet_v);
                profitSinceChange+=bet_v;
            }
      }
}