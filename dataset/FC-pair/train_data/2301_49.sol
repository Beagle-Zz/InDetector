contract c2301{
    /** @dev Compute the minimum activated pinakions in alpha.
     *  Note there may be multiple draws for a single user on a single dispute.
     */
    function getStakePerDraw() public view returns (uint minActivatedTokenInAlpha) {
        return (alpha * minActivatedToken) / ALPHA_DIVISOR;
    }
}