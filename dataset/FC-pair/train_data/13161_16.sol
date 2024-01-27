contract c13161{
//@dev returns the number of pixels an address owns
    function balanceOf(address _owner) public view returns (uint) {
        return ownerPixelCount[_owner];
    }
}