contract c2499{
    /**
    * @notice _addModule handles the attachment (or replacement) of modules for the ST
    * @dev  E.G.: On deployment (through the STR) ST gets a TransferManager module attached to it
    * @dev to control restrictions on transfers.
    * @dev You are allowed to add a new moduleType if:
    * @dev - there is no existing module of that type yet added
    * @dev - the last member of the module list is replacable
    * @param _moduleFactory is the address of the module factory to be added
    * @param _data is data packed into bytes used to further configure the module (See STO usage)
    * @param _maxCost max amount of POLY willing to pay to module. (WIP)
    */
    function _addModule(address _moduleFactory, bytes _data, uint256 _maxCost, uint256 _budget) internal {
        //Check that module exists in registry - will throw otherwise
        IModuleRegistry(moduleRegistry).useModule(_moduleFactory);
        IModuleFactory moduleFactory = IModuleFactory(_moduleFactory);
        uint8 moduleType = moduleFactory.getType();
        require(modules[moduleType].length < MAX_MODULES, "Limit of MAX MODULES is reached");
        uint256 moduleCost = moduleFactory.setupCost();
        require(moduleCost <= _maxCost, "Max Cost is always be greater than module cost");
        //Approve fee for module
        require(ERC20(polyToken).approve(_moduleFactory, moduleCost), "Not able to approve the module cost");
        //Creates instance of module from factory
        address module = moduleFactory.deploy(_data);
        //Approve ongoing budget
        require(ERC20(polyToken).approve(module, _budget), "Not able to approve the budget");
        //Add to SecurityToken module map
        bytes32 moduleName = moduleFactory.getName();
        modules[moduleType].push(ModuleData(moduleName, module));
        //Emit log event
        emit LogModuleAdded(moduleType, moduleName, _moduleFactory, module, moduleCost, _budget, now);
    }
}