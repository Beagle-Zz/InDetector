contract c11599{
    // Start the ICO period, is required the waitingForICO state of the contract
    function startICO() public onlyOwner returns (bool success) {
        require(contract_state == State.waitingForICO);
        contract_state = State.ICO;
        NewState(contract_state);
        return true;
    }
}