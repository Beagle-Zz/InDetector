contract c7962{
    /*** CONSTANTS ***/
    /// @dev Starting price of a regular Animecard.
    // uint128 private constant STARTING_PRICE = 0.01 ether;
    /// @dev Creates a new Animecard
    function createAnimecard(
        string _characterName,
        string _studioName,
        string _characterImageUrl,
        string _characterImageHash,
        uint256 _price
    )
    public
    onlyAnimator
    returns(uint) {
        uint256 animecardId = _createAnimecard(
            _characterName, _studioName,
            _characterImageUrl, _characterImageHash,
            _price, address(this)
        );
        return animecardId;
    }
}