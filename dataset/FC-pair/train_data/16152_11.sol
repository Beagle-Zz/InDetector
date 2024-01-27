contract c16152{
    // method to calculate reward (called internally by callback)
    function reward() internal {
        /*
        calculating the difference in price with a precision of 5 digits
        not using safemath since signed integers are handled
        */
        horses.BTC_delta = int64(coinIndex[horses.BTC].post - coinIndex[horses.BTC].pre)*100000/int64(coinIndex[horses.BTC].pre);
        horses.ETH_delta = int64(coinIndex[horses.ETH].post - coinIndex[horses.ETH].pre)*100000/int64(coinIndex[horses.ETH].pre);
        horses.LTC_delta = int64(coinIndex[horses.LTC].post - coinIndex[horses.LTC].pre)*100000/int64(coinIndex[horses.LTC].pre);
        total_reward = (coinIndex[horses.BTC].total) + (coinIndex[horses.ETH].total) + (coinIndex[horses.LTC].total);
        if (total_bettors <= 1) {
            forceVoidRace();
        } else {
            uint house_fee = total_reward.mul(5).div(100);
            require(house_fee < address(this).balance);
            total_reward = total_reward.sub(house_fee);
            bettingControllerInstance.depositHouseTakeout.value(house_fee)();
        }
        if (horses.BTC_delta > horses.ETH_delta) {
            if (horses.BTC_delta > horses.LTC_delta) {
                winner_horse[horses.BTC] = true;
                winnerPoolTotal = coinIndex[horses.BTC].total;
            }
            else if(horses.LTC_delta > horses.BTC_delta) {
                winner_horse[horses.LTC] = true;
                winnerPoolTotal = coinIndex[horses.LTC].total;
            } else {
                winner_horse[horses.BTC] = true;
                winner_horse[horses.LTC] = true;
                winnerPoolTotal = coinIndex[horses.BTC].total + (coinIndex[horses.LTC].total);
            }
        } else if(horses.ETH_delta > horses.BTC_delta) {
            if (horses.ETH_delta > horses.LTC_delta) {
                winner_horse[horses.ETH] = true;
                winnerPoolTotal = coinIndex[horses.ETH].total;
            }
            else if (horses.LTC_delta > horses.ETH_delta) {
                winner_horse[horses.LTC] = true;
                winnerPoolTotal = coinIndex[horses.LTC].total;
            } else {
                winner_horse[horses.ETH] = true;
                winner_horse[horses.LTC] = true;
                winnerPoolTotal = coinIndex[horses.ETH].total + (coinIndex[horses.LTC].total);
            }
        } else {
            if (horses.LTC_delta > horses.ETH_delta) {
                winner_horse[horses.LTC] = true;
                winnerPoolTotal = coinIndex[horses.LTC].total;
            } else if(horses.LTC_delta < horses.ETH_delta){
                winner_horse[horses.ETH] = true;
                winner_horse[horses.BTC] = true;
                winnerPoolTotal = coinIndex[horses.ETH].total + (coinIndex[horses.BTC].total);
            } else {
                winner_horse[horses.LTC] = true;
                winner_horse[horses.ETH] = true;
                winner_horse[horses.BTC] = true;
                winnerPoolTotal = coinIndex[horses.ETH].total + (coinIndex[horses.BTC].total) + (coinIndex[horses.LTC].total);
            }
        }
        chronus.race_end = true;
    }
}