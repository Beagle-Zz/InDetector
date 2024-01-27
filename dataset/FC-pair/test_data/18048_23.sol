contract c18048{
    /**
    * @dev Calculates the amount that has already vested.
    * @param token ERC20 token which is being vested
    */
    function vestedAmount(ERC20Basic token) public view returns (uint256) {
        uint256 currentBalance = token.balanceOf(this);
        uint256 totalBalance = currentBalance.add(released[token]);
        if (now < cliff) {
            return 0;
        } else if (now >= start.add(duration * periods) || revoked[token]) {
            return totalBalance;
        } else {
            uint256 periodTokens = totalBalance.div(periods);
            uint256 periodsOver = now.sub(start).div(duration) + 1;
            if (periodsOver >= periods) {
                return totalBalance;
            }
            return periodTokens.mul(periodsOver);
        }
    }
}