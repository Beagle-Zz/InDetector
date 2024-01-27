contract c16407{
    /**
    * @dev Connect to Battle contract
    */
    function setBattleContractAddress(address _address) external contract_onlyOwner returns (bool success) {
        battleContract = BattleInterface(_address);
        battleContractAddress = _address;
        return true;
    }
}