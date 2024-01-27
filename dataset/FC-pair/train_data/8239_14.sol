contract c8239{
    /**
     * @dev Allows the owner to change the token limit by airdrop.
     * @param _currentCirculating The current circulating tokens in wei.
     */
    function changeCurrentCirculating(uint256 _currentCirculating) public
    onlyOwner {
        emit CurrentCirculatingChanged(currentCirculating, _currentCirculating);
        currentCirculating = _currentCirculating;
    }
}