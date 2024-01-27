contract c8929{
    /**
     * Could be called only from withdraw address.
     */
    modifier onlyWithdrawAddress () {
        require(msg.sender == withdrawAddress);
        _;
    }
}