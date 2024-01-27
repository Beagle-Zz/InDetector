contract c13161{
//@dev add an address to a pixel's approved list
    function approve(address _to, uint _pixelId) public  {
        address owner = ownerOf(_pixelId);
        require(_to != owner);
        require(msg.sender == owner || isApprovedForAll(owner,msg.sender));
        if(getApproved(_pixelId) != address(0) || _to != address(0)) {
            pixelToApproved[_pixelId] = _to;
            emit Approval(msg.sender, _to, _pixelId);
        }
    }
}