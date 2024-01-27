contract c10746{
    /* function to transfer agreement ownership to other wallet by owner
        it's in ERC20 form so owners can use standard ERC20 wallet just need to pass full balance as value */
    function transfer(address to, uint amount) public returns (bool) { // solhint-disable-line no-simple-event-func-name
        require(amount == agreements[agreementOwners[msg.sender]].balance, "must transfer full balance");
        _transfer(msg.sender, to);
        return true;
    }
}