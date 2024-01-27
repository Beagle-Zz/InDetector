contract c40343{
     
     
     
     
    function checkUniqueAndRegisterNewKingdomName(
        string _kingdomName,
        uint _newKingdomNumber
    ) internal {
        uint fuzzyHash = computeNameFuzzyHash(_kingdomName);
        if (kingdomNumbersByfuzzyHash[fuzzyHash] != 0) {
            throw;
        }
        kingdomNumbersByfuzzyHash[fuzzyHash] = _newKingdomNumber;
    }
}