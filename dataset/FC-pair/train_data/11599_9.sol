contract c11599{
    // Finish the PRE-SALE period, is required the Presale state of the contract
    function finishPresale() public onlyOwner returns (bool success) {
        require(contract_state == State.Presale);
        contract_state = State.waitingForICO;
        NewState(contract_state);
        return true;
    }
}