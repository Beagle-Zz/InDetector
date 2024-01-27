contract c13161{
//@dev used to verify ownership
    modifier onlyOwnerOf(uint _pixelId) {
        require(msg.sender == ownerOf(_pixelId));
        _;
    }
}