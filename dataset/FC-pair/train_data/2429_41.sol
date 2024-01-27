contract c2429{
    /**
    *@dev Allows a user to deploy a new swap contract, if they pay the fee
    *@param _start_date the contract start date 
    *@return new_contract address for he newly created swap address and calls 
    *event 'ContractCreation'
    */
    function deployContract(uint _start_date) public payable returns (address) {
        require(msg.value >= fee && isWhitelisted(msg.sender));
        require(_start_date % 86400 == 0);
        address new_contract = deployer.newContract(msg.sender, user_contract, _start_date);
        contracts.push(new_contract);
        created_contracts[new_contract] = _start_date;
        emit ContractCreation(msg.sender,new_contract);
        return new_contract;
    }
}