contract c2280{
    /**
    *@dev Getter for the total_supply of tokens in the contract
    *@return total supply
    */
    function totalSupply() public constant returns (uint _total_supply) {
       return drct.totalSupply();
    }
}