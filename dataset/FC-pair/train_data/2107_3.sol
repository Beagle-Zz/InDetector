contract c2107{
    /*
     * @notice ERC20 Standard method to return the token balance of an address
     * @param tokenOwner Address to query
     */
    function balanceOf(address tokenOwner) public view returns (uint balance){
       return balances[tokenOwner];
    }
}