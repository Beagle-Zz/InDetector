contract c13282{
    /**
     * @dev Allows the current owner to transfer control of the contract to a newContract.
     * @param newContract The address to transfer ownership to.
     */
    function setContract(address newContract) public onlyOwner() {
        require(newContract != address(0));
        contract_num++;
        require(contract_num <= 5);
        emit ContractTransferred(newContract);
        contract_addr[contract_num-1] = newContract;
    }
}