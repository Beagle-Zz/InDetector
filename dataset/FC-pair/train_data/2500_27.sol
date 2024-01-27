contract c2500{
   /**
    * @notice Called by a security token to notify the registry it is using a module
    * @param _moduleFactory is the address of the relevant module factory
    */
    function useModule(address _moduleFactory) external {
        //If caller is a registered security token, then register module usage
        if (ISecurityTokenRegistry(securityTokenRegistry).isSecurityToken(msg.sender)) {
            require(registry[_moduleFactory] != 0, "ModuleFactory type should not be 0");
            //To use a module, either it must be verified, or owned by the ST owner
            require(verified[_moduleFactory]||(IModuleFactory(_moduleFactory).owner() == ISecurityToken(msg.sender).owner()),
              "Module factory is not verified as well as not called by the owner");
            reputation[_moduleFactory].push(msg.sender);
            emit LogModuleUsed (_moduleFactory, msg.sender);
        }
    }
}