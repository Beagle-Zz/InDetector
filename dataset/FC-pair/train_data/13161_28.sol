contract c13161{
    //@dev return the pixels owned by an address
    function getPixelsOwned(address _owner) public view returns(uint[]) {
        return ownerToPixel[_owner];
    }
}