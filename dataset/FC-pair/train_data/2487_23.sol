contract c2487{
    /**
    * @notice use to check the permission on delegate corresponds to module contract address
    * @param _delegate Ethereum address of the delegate
    * @param _module Ethereum contract address of the module
    * @param _perm Permission flag
    * @return bool
    */
    function checkPermission(address _delegate, address _module, bytes32 _perm) public view returns(bool) {
        if (delegateDetails[_delegate] != bytes32(0)) {
            return perms[_module][_delegate][_perm];
        }else
            return false;
    }
}