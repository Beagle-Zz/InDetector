contract c13161{
//@dev returns approved Addresses
    function getApproved(uint _pixelId) public view returns(address){
        return pixelToApproved[_pixelId];
    }
}