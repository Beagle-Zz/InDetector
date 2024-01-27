contract c13161{
//@dev used to allow operators to transfer and to manage the pixels
    modifier canManageAndTransfer(uint _pixelId) {
        require(isApprovedOrOwner(msg.sender, _pixelId));
        _;
    }
}