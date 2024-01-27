contract c13161{
//@dev returns the owner of a pixel
    function ownerOf(uint _pixelId)  public view returns (address) {
        address owner = pixelToOwner[_pixelId];
        return owner;
    }
}