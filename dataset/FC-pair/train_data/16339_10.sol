contract c16339{
    // method to place the oraclize queries
    function setupRace(uint delay, uint  locking_duration) onlyOwner beforeBetting public payable returns(bool) {
        // if (oraclize_getPrice("URL") > (this.balance)/6) {
        if (oraclize_getPrice("URL")*3 + oraclize_getPrice("URL", horses.customGasLimit)*3  > address(this).balance) {
            emit newOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
            return false;
        } else {
            chronus.starting_time = uint32(block.timestamp);
            chronus.betting_open = true;
            bytes32 temp_ID; // temp variable to store oraclize IDs
            emit newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            // bets open price query
            chronus.betting_duration = uint32(delay);
            temp_ID = oraclize_query(delay, "URL", "json(https://api.coinmarketcap.com/v1/ticker/ethereum/).0.price_usd");
            oraclizeIndex[temp_ID] = horses.ETH;
            coinIndex[horses.ETH].preOraclizeId = temp_ID;
            temp_ID = oraclize_query(delay, "URL", "json(https://api.coinmarketcap.com/v1/ticker/litecoin/).0.price_usd");
            oraclizeIndex[temp_ID] = horses.LTC;
            coinIndex[horses.LTC].preOraclizeId = temp_ID;
            temp_ID = oraclize_query(delay, "URL", "json(https://api.coinmarketcap.com/v1/ticker/bitcoin/).0.price_usd");
            oraclizeIndex[temp_ID] = horses.BTC;
            coinIndex[horses.BTC].preOraclizeId = temp_ID;
            //bets closing price query
            delay = delay.add(locking_duration);
            temp_ID = oraclize_query(delay, "URL", "json(https://api.coinmarketcap.com/v1/ticker/ethereum/).0.price_usd",horses.customGasLimit);
            oraclizeIndex[temp_ID] = horses.ETH;
            coinIndex[horses.ETH].postOraclizeId = temp_ID;
            temp_ID = oraclize_query(delay, "URL", "json(https://api.coinmarketcap.com/v1/ticker/litecoin/).0.price_usd",horses.customGasLimit);
            oraclizeIndex[temp_ID] = horses.LTC;
            coinIndex[horses.LTC].postOraclizeId = temp_ID;
            temp_ID = oraclize_query(delay, "URL", "json(https://api.coinmarketcap.com/v1/ticker/bitcoin/).0.price_usd",horses.customGasLimit);
            oraclizeIndex[temp_ID] = horses.BTC;
            coinIndex[horses.BTC].postOraclizeId = temp_ID;
            chronus.race_duration = uint32(delay);
            return true;
        }
    }
}