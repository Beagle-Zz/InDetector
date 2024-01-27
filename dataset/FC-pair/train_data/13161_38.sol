contract c13161{
//@dev ERC721 compliance to check what address it is being sent to
    function checkAndCallSafeTransfer(address _from, address _to, uint256 _pixelId, bytes _data)
    internal
    returns (bool)
    {
        if (!_to.isContract()) {
            return true;
        }
        bytes4 retval = ERC721Receiver(_to).onERC721Received(
        _from, _pixelId, _data);
        return (retval == ERC721_RECEIVED);
    }
}