contract c40344{
     
     
     
     
     
     
     
     
    function validateProposedMonarchName(string _monarchName) constant
    returns (bool allowed) {
        return validateNameInternal(_monarchName);
    }
}