contract c2500{
    /**
    * @notice Called by Polymath to verify modules for SecurityToken to use.
    * @notice A module can not be used by an ST unless first approved/verified by Polymath
    * @notice (The only exception to this is that the author of the module is the owner of the ST)
    * @param _moduleFactory is the address of the module factory to be registered
    * @return bool
    */
    function verifyModule(address _moduleFactory, bool _verified) external onlyOwner returns(bool) {
        //Must already have been registered
        require(registry[_moduleFactory] != 0, "Module factory should have been already registered");
        verified[_moduleFactory] = _verified;
        emit LogModuleVerified(_moduleFactory, _verified);
        return true;
    }
}