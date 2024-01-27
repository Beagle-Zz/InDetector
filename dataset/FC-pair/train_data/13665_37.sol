contract c13665{
    /**
    * @notice Assigns prize percentage for the lucky top 30 winners. Each token will be assigned a uint256 inside
    * tokenToPayoutMap structure that represents the size of the pot that belongs to that token. If any tokens
    * tie inside of the first 30 tokens, the prize will be summed and divided equally. 
    */
    function setTopWinnerPrizes() external onlyAdmin checkState(pointsValidationState.OrderChecked){
        uint256 percent = 0;
        uint[] memory tokensEquals = new uint[](30);
        uint16 tokenEqualsCounter = 0;
        uint256 currentTokenId;
        uint256 currentTokenPoints;
        uint256 lastTokenPoints;
        uint32 counter = 0;
        uint256 maxRange = 13;
        if(tokens.length < 201){
          maxRange = 10;
        }
        while(payoutRange < maxRange){
          uint256 inRangecounter = payDistributionAmount[payoutRange];
          while(inRangecounter > 0){
            currentTokenId = sortedWinners[counter];
            currentTokenPoints = tokenToPointsMap[currentTokenId];
            inRangecounter--;
            //Special case for the last one
            if(inRangecounter == 0 && payoutRange == maxRange - 1){
                if(currentTokenPoints == lastTokenPoints){
                  percent += payoutDistribution[payoutRange];
                  tokensEquals[tokenEqualsCounter] = currentTokenId;
                  tokenEqualsCounter++;
                }else{
                  tokenToPayoutMap[currentTokenId] = payoutDistribution[payoutRange];
                }
            }
            if(counter != 0 && (currentTokenPoints != lastTokenPoints || (inRangecounter == 0 && payoutRange == maxRange - 1))){ //Fix second condition
                    for(uint256 i=0;i < tokenEqualsCounter;i++){
                        tokenToPayoutMap[tokensEquals[i]] = percent.div(tokenEqualsCounter);
                    }
                    percent = 0;
                    tokensEquals = new uint[](30);
                    tokenEqualsCounter = 0;
            }
            percent += payoutDistribution[payoutRange];
            tokensEquals[tokenEqualsCounter] = currentTokenId;
            tokenEqualsCounter++;
            counter++;
            lastTokenPoints = currentTokenPoints;
           }
           payoutRange++;
        }
        pValidationState = pointsValidationState.TopWinnersAssigned;
        lastPrizeGiven = counter;
    }
}