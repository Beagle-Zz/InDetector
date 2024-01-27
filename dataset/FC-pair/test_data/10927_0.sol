contract c10927{
    /**
    * @dev Returns number of tokens in circulation
    *
    * @return total number od tokens
    */
    function totalSupply() public constant returns (uint256) {
        return supply;
    }
}