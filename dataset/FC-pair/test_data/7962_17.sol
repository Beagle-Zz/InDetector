contract c7962{
    /// @dev An internal method that creates a new anime card and stores it.
    /// @param _characterName The name of the character
    /// @param _studioName The studio that created this character
    /// @param _characterImageUrl AWS S3-CDN URL for character image
    /// @param _characterImageHash IPFS hash for character image
    /// @param _price of animecard character
    /// @param _owner The initial owner of this anime card
    function _createAnimecard(
        string _characterName,
        string _studioName,
        string _characterImageUrl,
        string _characterImageHash,
        uint256 _price,
        address _owner
    )
    internal
    returns(uint) {
        Animecard memory _animecard = Animecard({
            characterName: _characterName,
            studioName: _studioName,
            characterImageUrl: _characterImageUrl,
            characterImageHash: _characterImageHash,
            creationTime: uint64(now)
        });
        uint256 newAnimecardId = animecards.push(_animecard);
        newAnimecardId = newAnimecardId.sub(1);
        // Fire the birth event.
        Birth(
            _owner,
            newAnimecardId,
            _animecard.characterName,
            _animecard.studioName
        );
        // Set the price for the animecard.
        animecardToPrice[newAnimecardId] = _price;
        // This will assign ownership, and also fire the Transfer event as per ERC-721 draft.
        _transfer(0, _owner, newAnimecardId);
        return newAnimecardId;
    }
}