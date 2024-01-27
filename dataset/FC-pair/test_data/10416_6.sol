contract c10416{
                 //*** ERC20 FUNCTIONS ***//
    //1
    /**
    * @dev total number of tokens in existence
    */
    function totalSupply() public constant returns (uint256 _totalSupply) {
        //set the named return variable as the global variable totalSupply
        _totalSupply = TOTALSUPPLY;
    }
}