contract c12447{
    // change escrow
    function changeEscrow(address _escrow) public
        onlyNamiMultisig
    {
        require(_escrow != 0x0);
        escrow = _escrow;
    }
}