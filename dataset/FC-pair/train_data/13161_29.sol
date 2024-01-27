contract c13161{
    //@dev return number of pixels owned by an address
    function getOwnerPixelCount(address _owner) public view returns(uint) {
        return ownerPixelCount[_owner];
    }
}