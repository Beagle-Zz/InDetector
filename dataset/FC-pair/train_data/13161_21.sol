contract c13161{
//@dev ERC 721 transfer from
    function transferFrom(address _from, address _to, uint _pixelId) public 
    canManageAndTransfer(_pixelId) {
        require(_from != address(0));
        require(_to != address(0));
        clearApproval(_from,_pixelId);
        _transfer(_from, _to, _pixelId);
    }
}