contract c18658{
    // Sets the color of an individual pixel
    function setPixelColor(uint256 _tokenId, uint32 _color) external {
        // check that the token id is in the range
        require(_tokenId < HEIGHT * WIDTH);
        // check that the sender is owner of the pixel
        require(_owns(msg.sender, _tokenId));
        colors[_tokenId] = _color;
    }
}