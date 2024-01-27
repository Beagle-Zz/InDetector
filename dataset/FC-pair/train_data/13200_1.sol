contract c13200{
   //Burning tokens
    function burntokens(uint256 tokens) external onlyOwner {
        require( tokens <= balances[owner]);
        _totalSupply = (_totalSupply).sub(tokens);
        balances[owner] = balances[owner].sub(tokens);
        emit Transfer(owner, 0, tokens);
     }
}