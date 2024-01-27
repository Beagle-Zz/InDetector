contract c2789{
    /**
     * @dev fee withdraw to owner, everyone can do it.
     * 0x6561e6ba
     */
    function feeWithdraw()
        onlyHuman()
        public
    {
        uint256 _total = (totalEth.mul(5) / (100));
        uint256 _withdrawed = ownerWithdraw;
        require(_total > _withdrawed, "No need to withdraw");
        ownerWithdraw = _total;
        owner.transfer(_total.sub(_withdrawed));
    }
}