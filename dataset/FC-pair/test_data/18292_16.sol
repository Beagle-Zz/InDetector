contract c18292{
    /**
    * @dev Checks if the address is a smart contract.
    * @param addr The address that required to be checked.
    * @return True if the account in the address is a smart contract, False if the address is an EOA.
    */
    function isContract(address addr) internal view returns (bool) {
        uint size;
        assembly { 
          size := extcodesize(addr)
        }
        return size > 0;
    }
}