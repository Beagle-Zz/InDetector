contract c8223{
    /**
    * @dev it will check amount of token delegated to spender by owner
    * @param owner the address which allows someone to spend fund on his behalf
    * @param spender address which is delegated
    * @return return uint256 amount of tokens left with delegator
    */
    function allowance(address owner, address spender) public view returns (uint256) {
        return allowed[owner][spender];
    }
}