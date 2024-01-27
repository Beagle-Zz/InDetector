contract c18930{
    //Called from outside to auto handle BTC and FIAT purchases
    function forwardTokens(address _beneficiary, uint256 totalTokens) onlyOwner onlyWhileOpen public {        
        _preValidateTokenTransfer(_beneficiary, totalTokens);
        _deliverTokens(_beneficiary, totalTokens);
    }
}