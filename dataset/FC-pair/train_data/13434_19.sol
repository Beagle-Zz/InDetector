contract c13434{
  // administrative use to correct any token transaction errors
    function deliverTokensAdmin(address _beneficiary, uint256 _tokenAmount) public onlyOwner {
        token.transfer(_beneficiary, _tokenAmount);
        remainingSupply_ = remainingSupply_.sub(_tokenAmount);
    }
}