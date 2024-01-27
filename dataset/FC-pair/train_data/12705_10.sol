contract c12705{
    /**
     * @notice Checks if a contract is behind an address.
     * @dev Does it by checking if it has ANY code.
     **/
    function isContract(address _addr) public view returns(bool is_contract){
        uint length;
        assembly {
            //retrieve the code length/size on target address
            length := extcodesize(_addr)
        }
      return (length>0);
    }
}