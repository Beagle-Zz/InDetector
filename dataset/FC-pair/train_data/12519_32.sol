contract c12519{
    // Mint RAcoin tokens and approve the passed address to spend the minted amount of tokens
    // Using different types of minting functions has no effect on total limit of 20,000,000,000 RAC that can be created
    function mintTokensWithApproval(address _target, uint _mintedAmount, address _spender) public onlyOwner returns (bool success) {
        require(_mintedAmount <= unmintedTokens);
        balances[_target] += _mintedAmount;
        unmintedTokens -= _mintedAmount;
        _totalSupply += _mintedAmount;
        allowed[_target][_spender] += _mintedAmount;
        emit Transfer(1, _target, _mintedAmount);
        return true;
    }
}