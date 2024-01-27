contract c2498{
     /**
     * @notice used to launch the Module with the help of factory
     * @return address Contract address of the Module
     */
    function deploy(bytes _data) external returns(address) {
        if(setupCost > 0)
            require(polyToken.transferFrom(msg.sender, owner, setupCost), "Failed transferFrom because of sufficent Allowance is not provided");
        //Check valid bytes - can only call module init function
        CappedSTO cappedSTO = new CappedSTO(msg.sender, address(polyToken));
        //Checks that _data is valid (not calling anything it shouldn't)
        require(getSig(_data) == cappedSTO.getInitFunction(), "Provided data is not valid");
        require(address(cappedSTO).call(_data), "Un-successfull call");
        emit LogGenerateModuleFromFactory(address(cappedSTO), getName(), address(this), msg.sender, now);
        return address(cappedSTO);
    }
}