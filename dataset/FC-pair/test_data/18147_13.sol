contract c18147{
    /**
    * @notice Check whether an address is a regular address or not.
    * @param _addr Address of the contract that has to be checked
    * @return `true` if `_addr` is a regular address (not a contract)
    */
    function isRegularAddress(address _addr) internal constant returns(bool) {
        if (_addr == 0) { return false; }
        uint size;
        assembly { size := extcodesize(_addr) } // solhint-disable-line no-inline-assembly
        return size == 0;
    }
}