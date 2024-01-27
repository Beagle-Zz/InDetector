contract c3031{
    /**
    * @dev check balance of address
    * @param _owner Address
    * @return Amount of token in possession
    **/
    function balanceOf(address _owner) public constant returns (uint256) {
        return balances[_owner];
    }
}