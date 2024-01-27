contract c2281{
    /**
    *@dev Sets the deployer address
    *@param _deployer is the new deployer address
    */
    function setDeployer(address _deployer) public onlyOwner() {
        deployer_address = _deployer;
        deployer = Deployer_Interface(_deployer);
    }
}