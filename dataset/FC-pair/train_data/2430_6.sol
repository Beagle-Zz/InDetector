contract c2430{
    /**
    *@dev Getter for the total_supply of tokens in the contract
    *@return total supply
    */
    function totalSupply(TokenStorage storage self) public constant returns (uint _total_supply) {
       return self.total_supply;
    }
}