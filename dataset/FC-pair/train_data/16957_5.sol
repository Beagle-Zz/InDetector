contract c16957{
    //--------------------------------------------------------------------------
    // ERC20 support
    //--------------------------------------------------------------------------
    function totalSupply() public constant returns(uint256) {
        return estimatedSupply;
    }
}