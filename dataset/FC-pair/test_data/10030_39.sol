contract c10030{
    /*
     * @dev returns the number of matches on the contract
     */ 
    function getNumMatches() public view returns (uint) {
        return matches.length;
    }
}