contract c18658{
    // buy an area of pixels, left to right, top to bottom
    function buyEmptyPixelArea(uint256 x, uint256 y, uint256 x2, uint256 y2) external payable {
        require(x2 > x && y2 > y);
        require(x2 <= WIDTH && y2 <= HEIGHT);
        require(msg.value == pixelPrice * (x2-x) * (y2-y));
        uint256 i;
        uint256 tokenId;
        uint256 j;
        // check that all pixels to buy are available
        for (i = y; i < y2; i++) {
            tokenId = i * WIDTH;
            for (j = x; j < x2; j++) {
                require(pixelIndexToOwner[tokenId + j] == address(0));
            }
        }
        authorityBalance += msg.value;
        // Do the actual transfer
        for (i = y; i < y2; i++) {
            tokenId = i * WIDTH;
            for (j = x; j < x2; j++) {
                _transfer(0, msg.sender, tokenId + j);
            }
        }
    }
}