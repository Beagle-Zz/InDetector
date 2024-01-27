contract c10780{
    // Issue tokens. See MonetarySupervisor but as a rule of thumb issueTo is only allowed:
    //      - on new loan (by trusted Lender contracts)
    //      - when converting old tokens using MonetarySupervisor
    //      - strictly to reserve by Stability Board (via MonetarySupervisor)
    function issueTo(address to, uint amount) external restrict("MonetarySupervisor") {
        balances[to] = balances[to].add(amount);
        totalSupply = totalSupply.add(amount);
        emit Transfer(0x0, to, amount);
        emit AugmintTransfer(0x0, to, amount, "", 0);
    }
}