contract c40341{
     
     
     
     
     
     
     
     
     
     
     
    function validateProposedKingdomName(string _kingdomName) constant
    returns (bool allowed) {
        return validateNameInternal(_kingdomName);
    }
}