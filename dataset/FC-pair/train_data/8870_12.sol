contract c8870{
    /**
     * @dev Allows the owner to change the token limit by airdrop.
     * @param _airdropLimit The token limit by airdrop in wei.
     */
    function changeAirdropLimit(uint256 _airdropLimit) public
    onlyOwner {
        emit AirdropLimitChanged(airdropLimit, _airdropLimit);
        airdropLimit = _airdropLimit;
    }
}