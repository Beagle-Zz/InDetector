contract c16339{
    // exposing the coin pool details for DApp
    function getCoinIndex(bytes32 index, address candidate) external constant returns (uint, uint, uint, bool, uint) {
        return (coinIndex[index].total, coinIndex[index].pre, coinIndex[index].post, coinIndex[index].price_check, voterIndex[candidate].bets[index]);
    }
}