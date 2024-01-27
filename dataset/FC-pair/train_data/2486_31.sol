contract c2486{
    /**
     * @notice used to launch the Module with the help of factory
     * @param _data Data used for the intialization of the module factory variables
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {
        if(setupCost > 0)
            require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");
        CountTransferManager countTransferManager = new CountTransferManager(msg.sender, address(polyToken));
        require(getSig(_data) == countTransferManager.getInitFunction(), "Provided data is not valid");
        require(address(countTransferManager).call(_data), "Un-successfull call");
        emit LogGenerateModuleFromFactory(address(countTransferManager), getName(), address(this), msg.sender, now);
        return address(countTransferManager);
    }
}