contract c13161{
//@dev returns the total number of pixels generated
    function totalSupply() public view returns (uint) {
        return pixels.length;
    }
}