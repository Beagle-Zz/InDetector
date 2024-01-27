contract c40589{
     
     
    function fillOrderAuto() public returns (bool) {
        return _fillOrder(msg.sender, getTransferableBalance(msg.sender));
    }
}