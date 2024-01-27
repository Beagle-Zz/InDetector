contract c13161{
//@dev internal function to remove approval on a pixel
    function clearApproval(address _owner, uint256 _pixelId) internal {
        require(ownerOf(_pixelId) == _owner);
        if(pixelToApproved[_pixelId] != address(0)) {
            pixelToApproved[_pixelId] = address(0);
            emit Approval(_owner,address(0),_pixelId);
        }
    }
}