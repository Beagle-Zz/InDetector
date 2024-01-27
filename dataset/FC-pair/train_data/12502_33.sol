contract c12502{
    /**
     * @dev Calculates the amount that has already vested but hasn't been released yet.
     */
    function releasableAmount() public view returns (uint256) {
        return _releasableAmount(msg.sender);
    }
}