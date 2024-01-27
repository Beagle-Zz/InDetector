contract c10927{
    /**
    * @dev Returns the balance of specific account
    *
    * @param _owner The account that caller wants to querry
    * @return the balance on this account
    */
    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }
}