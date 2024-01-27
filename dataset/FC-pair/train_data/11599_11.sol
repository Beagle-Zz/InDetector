contract c11599{
    // Our tokens
    function finishICO() public onlyOwner returns (bool success) {
        require(contract_state == State.ICO);
        mintTokens(owner, 50000000000000000000000000);
        contract_state = State.Active;
        NewState(contract_state);
        return true;
    }
}