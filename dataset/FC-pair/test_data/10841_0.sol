contract c10841{
    /**
     * @notice Transfers tokens held by timelock to beneficiary.
     */
    function release() public {
        // solium-disable-next-line security/no-block-members
        require(now >= RELEASE_TIME);
        uint256 num = (now - RELEASE_TIME) / RELEASE_PERIODS;
        require(num + 1 > numOfReleased);
        uint256 amount = tosToken.balanceOf(this).mul(30).div(100);
        require(amount > 0);
        tosToken.safeTransfer(beneficiary, amount);
        numOfReleased = numOfReleased.add(1);   
    }
}