contract c10309{
    /**
     * @dev release
     * param _token Oneledgertoken that will be released to beneficiary
     */
    function release() public {
        require(msg.sender == owner || msg.sender == beneficiary);
        require(token.balanceOf(this) >= 0 && now >= startFrom);
        uint256 elapsedTime = now.sub(startFrom);
        uint256 periodsInCurrentRelease = elapsedTime.div(period).sub(elapsedPeriods);
        uint256 tokensReadyToRelease = periodsInCurrentRelease.mul(tokensReleasedPerPeriod);
        uint256 amountToTransfer = tokensReadyToRelease > token.balanceOf(this) ? token.balanceOf(this) : tokensReadyToRelease;
        require(amountToTransfer > 0);
        elapsedPeriods = elapsedPeriods.add(periodsInCurrentRelease);
        token.transfer(beneficiary, amountToTransfer);
        emit Released(amountToTransfer);
    }
}