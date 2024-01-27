contract c18089{
    /**
     * @dev Check bnb contribution time, amount and hard cap overflow
     */
    function isValidBNBContribution() internal view returns(bool) {
        if(token.limitedWallets(msg.sender)) {
            return false;
        }
        if(!whiteList[msg.sender] && !privilegedList[msg.sender]) {
            return false;
        }
        uint256 amount = bnbToken.allowance(msg.sender, address(this));
        if(amount < BNB_MIN_CONTRIB || safeAdd(totalBNBContributed, amount) > BNB_HARD_CAP) {
            return false;
        }
        return true;
    }
}