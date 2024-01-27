contract c18363{
    /**
     *
     *   Return number of tokens for address
     */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}