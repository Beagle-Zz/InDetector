contract c13665{
    /**
    * @notice Allows any user to retrieve their asigned prize. This would be the sum of the price of all the tokens
    * owned by the caller of this function.
    * @dev If the caller has no prize, the function will revert costing no gas to the caller.
    */
    function withdrawPrize() external checkState(pointsValidationState.Finished){
        uint256 prize = 0;
        uint256[] memory tokenList = tokensOfOwnerMap[msg.sender];
        for(uint256 i = 0;i < tokenList.length; i++){
            prize += tokenToPayoutMap[tokenList[i]];
            tokenToPayoutMap[tokenList[i]] = 0;
        }
        require(prize > 0);
        msg.sender.transfer((prizePool.mul(prize)).div(1000000));
    }
}