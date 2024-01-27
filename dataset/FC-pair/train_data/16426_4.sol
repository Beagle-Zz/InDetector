contract c16426{
    // Send _value amount of tokens from address _from to address _to
    // The transferFrom method is used for a withdraw workflow, allowing contracts to send
    // tokens on your behalf, for example to "deposit" to a contract address and/or to charge
    // fees in sub-currencies; the command should fail unless the _from account has
    // deliberately authorized the sender of the message via some mechanism; we propose
    // these standardized APIs for approval:
    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    )public returns (bool success) {
        require(isSealed());
        // according to FFC's total supply, never overflow here
        if (accounts[_from].balance >= _amount
            && allowed[_from][msg.sender] >= _amount
            && _amount > 0) {
            accounts[_from].balance -= uint112(_amount);
            allowed[_from][msg.sender] -= _amount;
            accounts[_to].balance = _amount.add(accounts[_to].balance).toUINT112();
            emit Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
}