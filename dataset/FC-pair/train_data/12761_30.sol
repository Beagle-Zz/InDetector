contract c12761{
    /**
    * @dev Returns true if the given _address is a contract, false otherwise.
    */
    function isContract(address _address) private view returns (bool) {
        uint256 length;
        /* solium-disable-next-line */
        assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_address)
        }
        return (length>0);
    }
}