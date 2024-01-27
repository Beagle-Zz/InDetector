contract c18772{
    // @dev Adds bonus tokens by token supply bought by user
    // @param _totalSupply total supply of token bought during pre-sale/crowdsale
    // @param _newTokens tokens currently bought by user
    function addBonusTokens(uint256 _totalSupply, uint256 _newTokens) internal view returns (uint256) {
        uint returnTokens = 0;
        uint tokensToAdd = 0;
        uint tokensLeft = _newTokens;
        if(currentPhase == Phase.PresaleRunning){
            if(_totalSupply < TOKENS_FOR_PRESALE){
                if(_totalSupply + tokensLeft + tokensLeft.mul(50).div(100) > TOKENS_FOR_PRESALE){
                    tokensToAdd = TOKENS_FOR_PRESALE.sub(_totalSupply);
                    tokensToAdd = tokensToAdd.mul(100).div(150);
                    returnTokens = returnTokens.add(tokensToAdd);
                    returnTokens = returnTokens.add(tokensToAdd.mul(50).div(100));
                    tokensLeft = tokensLeft.sub(tokensToAdd);
                    _totalSupply = _totalSupply.add(tokensToAdd.add(tokensToAdd.mul(50).div(100)));
                } else { 
                    returnTokens = returnTokens.add(tokensLeft).add(tokensLeft.mul(50).div(100));
                    tokensLeft = tokensLeft.sub(tokensLeft);
                }
            }
        } 
        if (tokensLeft > 0 && _totalSupply < FRST_CRWDSALE_RATIO) {
            if(_totalSupply + tokensLeft + tokensLeft.mul(30).div(100)> FRST_CRWDSALE_RATIO){
                tokensToAdd = FRST_CRWDSALE_RATIO.sub(_totalSupply);
                tokensToAdd = tokensToAdd.mul(100).div(130);
                returnTokens = returnTokens.add(tokensToAdd).add(tokensToAdd.mul(30).div(100));
                tokensLeft = tokensLeft.sub(tokensToAdd);
                _totalSupply = _totalSupply.add(tokensToAdd.add(tokensToAdd.mul(30).div(100)));
            } else { 
                returnTokens = returnTokens.add(tokensLeft);
                returnTokens = returnTokens.add(tokensLeft.mul(30).div(100));
                tokensLeft = tokensLeft.sub(tokensLeft);
            }
        }
        if (tokensLeft > 0 && _totalSupply < SCND_CRWDSALE_RATIO) {
            if(_totalSupply + tokensLeft + tokensLeft.mul(15).div(100) > SCND_CRWDSALE_RATIO){
                tokensToAdd = SCND_CRWDSALE_RATIO.sub(_totalSupply);
                tokensToAdd = tokensToAdd.mul(100).div(115);
                returnTokens = returnTokens.add(tokensToAdd).add(tokensToAdd.mul(15).div(100));
                tokensLeft = tokensLeft.sub(tokensToAdd);
                _totalSupply = _totalSupply.add(tokensToAdd.add(tokensToAdd.mul(15).div(100)));
            } else { 
                returnTokens = returnTokens.add(tokensLeft);
                returnTokens = returnTokens.add(tokensLeft.mul(15).div(100));
                tokensLeft = tokensLeft.sub(tokensLeft);
            }
        }
        if (tokensLeft > 0)  {
            returnTokens = returnTokens.add(tokensLeft);
            tokensLeft = tokensLeft.sub(tokensLeft);
        }
        return returnTokens;
    }
}