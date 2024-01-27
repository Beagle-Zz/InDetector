contract c8456{
    // Are we reached tokens limit?
    function isReachedLimit() internal constant returns (bool) {
        return tokensCap.sub(totalSupply) == 0;
    }
}