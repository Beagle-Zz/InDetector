contract c16152{
    //oraclize callback method
    function __callback(bytes32 myid, string result, bytes proof) public {
        require (msg.sender == oraclize_cbAddress());
        require (!chronus.race_end);
        bytes32 coin_pointer; // variable to differentiate different callbacks
        chronus.race_start = true;
        chronus.betting_open = false;
        bettingControllerInstance.remoteBettingClose();
        coin_pointer = oraclizeIndex[myid];
        if (myid == coinIndex[coin_pointer].preOraclizeId) {
            if (coinIndex[coin_pointer].pre > 0) {
            } else if (now >= chronus.starting_time+chronus.betting_duration+ 15 minutes) {
                forceVoidRace();
            } else {
                coinIndex[coin_pointer].pre = stringToUintNormalize(result);
                emit newPriceTicker(coinIndex[coin_pointer].pre);
            }
        } else if (myid == coinIndex[coin_pointer].postOraclizeId){
            if (coinIndex[coin_pointer].pre > 0 ){
                if (coinIndex[coin_pointer].post > 0) {
                } else if (now >= chronus.starting_time+chronus.race_duration+ 15 minutes) {
                    forceVoidRace();
                } else {
                    coinIndex[coin_pointer].post = stringToUintNormalize(result);
                    coinIndex[coin_pointer].price_check = true;
                    emit newPriceTicker(coinIndex[coin_pointer].post);
                    if (coinIndex[horses.ETH].price_check && coinIndex[horses.BTC].price_check && coinIndex[horses.LTC].price_check) {
                        reward();
                    }
                }
            } else {
                forceVoidRace();
            }
        }
    }
}