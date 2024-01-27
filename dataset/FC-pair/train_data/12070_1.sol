contract c12070{
    /* Check whether an address is a contract address */
    function isContract(address addr) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(addr) }
        return (size > 0);
    }
}