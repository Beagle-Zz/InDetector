contract c3689{
// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface Methods for full compliance
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
    // totalSupply //
    function totalSupply() public constant returns (uint) {
        return totalSupplyAt(block.number);
    }
}