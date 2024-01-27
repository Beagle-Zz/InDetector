contract c40343{
     
    function findKingdomCalled(string _kingdomName) constant
    returns (uint kingdomNumber) {
        uint fuzzyHash = computeNameFuzzyHash(_kingdomName);
        return kingdomNumbersByfuzzyHash[fuzzyHash];
    }
}