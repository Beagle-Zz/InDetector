contract c18658{
    // buy en empty pixel
    function buyEmptyPixel(uint256 _tokenId) external payable {
        require(msg.value == pixelPrice);
        require(_tokenId < HEIGHT * WIDTH);
        require(pixelIndexToOwner[_tokenId] == address(0));
        // increase authority balance
        authorityBalance += msg.value;
        // This will assign ownership, and also emit the Transfer event as
        // per ERC721 draft
        _transfer(0, msg.sender, _tokenId);
    }
}