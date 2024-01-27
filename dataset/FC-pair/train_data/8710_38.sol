contract c8710{
     /**
      @dev Returns the number of tokens based on the ETH sent and token price.
      @param _value this contais the ETHs sent and it is used to calculate the right number of tokens to be transfered.
      @return number of tokens based on the ETH sent and token price.
     */
    function getTokens(uint256 _value)
    private view
    onlyInState(StatusList.Running)
    returns(uint256 numTokens, uint256 amountToReturn) {
        uint256 eths = _value.mul(10**decimals);//Adding decimals to get an acurate number of tokens
        numTokens = 0;
        uint256 tokensAvailable = 0;
        numTokens = eths.div(tokenPrice[uint256(stage)]);
        if (stage == StagesList.PrivateICO) {
            tokensAvailable = availablePrivateICO;
        } else if (stage == StagesList.PreICO) {
            tokensAvailable = availablePreICO;
        } else if (stage == StagesList.ICO_w1) {
            tokensAvailable = availableICO_w1;
        } else if (stage == StagesList.ICO_w2) {
            tokensAvailable = availableICO_w2;
        }
        if (tokensAvailable >= numTokens) {
            amountToReturn = 0;
        } else {
            numTokens = tokensAvailable;
            amountToReturn = _value.sub(numTokens.div(10**decimals).mul(tokenPrice[uint256(stage)]));
        }
        return (numTokens, amountToReturn);
    }
}