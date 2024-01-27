contract c10257{
    //@notice Private function the helps in comparing strings.
    function compareStrings(string a, string b) private pure returns (bool){
        return keccak256(a) == keccak256(b);
    }
}