contract c2487{
  /**
    * @notice Use to provide/change the permission to the delegate corresponds to the module contract
    * @param _delegate Ethereum address of the delegate
    * @param _module Ethereum contract address of the module
    * @param _perm Permission flag
    * @param _valid Bool flag use to switch on/off the permission
    * @return bool
    */
    function changePermission(
        address _delegate,
        address _module,
        bytes32 _perm,
        bool _valid
    )
    public
    withPerm(CHANGE_PERMISSION)
    returns(bool)
    {
        require(delegateDetails[_delegate] != bytes32(0), "Delegate details not set");
        perms[_module][_delegate][_perm] = _valid;
        emit LogChangePermission(_delegate, _module, _perm, _valid, now);
        return true;
    }
}