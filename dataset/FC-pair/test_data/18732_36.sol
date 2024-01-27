contract c18732{
    /**
    * Only ballast fund function to burn tokens from account
    *
    * Allows `fundAccount` burn tokens to send equivalent ether for account that claimed it
    * @param _from account address to burn tokens
    * @param _value quantity of tokens to burn
    */
    function redemptionBurn(address _from, uint256 _value) onlyFund public{
        _burn(_from, _value);
    }   
}