contract c2500{
    /**
    * @notice Called by moduleFactory owner to register new modules for SecurityToken to use
    * @param _moduleFactory is the address of the module factory to be registered
    * @return bool
    */
    function registerModule(address _moduleFactory) external whenNotPaused returns(bool) {
        require(registry[_moduleFactory] == 0, "Module factory should not be pre-registered");
        IModuleFactory moduleFactory = IModuleFactory(_moduleFactory);
        require(moduleFactory.getType() != 0, "Factory type should not equal to 0");
        registry[_moduleFactory] = moduleFactory.getType();
        moduleList[moduleFactory.getType()].push(_moduleFactory);
        reputation[_moduleFactory] = new address[](0);
        emit LogModuleRegistered (_moduleFactory, moduleFactory.owner());
        return true;
    }
}