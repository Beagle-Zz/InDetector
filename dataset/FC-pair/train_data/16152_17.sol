contract c16152{
    // exposing the total reward amount for DApp
    function reward_total() external constant returns (uint) {
        return ((coinIndex[horses.BTC].total) + (coinIndex[horses.ETH].total) + (coinIndex[horses.LTC].total));
    }
}