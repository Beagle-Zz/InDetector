contract c10641{
    //This function is used for taxation purposes and will be used after specific conditions
    function taxTransfer(address _from, address _to, uint256 _tokensAmount) public onlyConsumerAddress returns (bool) {
        require(_from != address(0));
        require(_to != address(0));
        balances[_from] = balances[_from].sub(_tokensAmount);
        balances[_to] = balances[_to].add(_tokensAmount);
        consumerAddress.onTaxTransfer(_from, _tokensAmount);
        return true;
    }
}