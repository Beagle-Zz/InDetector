contract c2487{
    /**
     * @notice used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes /* _data */) external returns(address) {
        if(setupCost > 0)
            require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");
        address permissionManager = new GeneralPermissionManager(msg.sender, address(polyToken));
        emit LogGenerateModuleFromFactory(address(permissionManager), getName(), address(this), msg.sender, now);
        return address(permissionManager);
    }
}