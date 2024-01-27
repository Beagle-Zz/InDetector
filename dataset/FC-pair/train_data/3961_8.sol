contract c3961{
    // function for the opportunity to gift parrots before the start of the game
    function transfer(
        address _to,
        uint256 _tokenId
    )
        external
        whenNotPaused
    {
        require(_to != address(0));
        require(_to != address(this));
        require(_owns(msg.sender, uint64(_tokenId)));
        _transfer(msg.sender, _to, _tokenId);
    }
}