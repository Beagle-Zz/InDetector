contract c16407{
    /**
    * @dev Connect to Battle contract
    */
    function setBattleRemoveContractAddress(address _address) external contract_onlyOwner returns (bool success) {
        battleRemoveContractAddress = _address;
        return true;
    }
}