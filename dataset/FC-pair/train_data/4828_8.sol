contract c4828{
    /**
     * @notice Transfers vested tokens to beneficiary.
     * @param token ERC20 token which is being vested
     */
    function release(ERC20 token) public {
        uint256 unreleased = releasableAmount(token);
        require(unreleased > 0);
        released[token] = released[token].add(unreleased);
        token.safeTransfer(beneficiary, unreleased);
        emit Released(unreleased);
    }
}