contract c13161{
///////////////////
///Public functions
///////////////////
//@dev returns if a pixel has already been purchased
    function exists(uint256 _pixelId) public view returns (bool) {
        address owner = pixelToOwner[_pixelId];
        return owner != address(0);
    }
}