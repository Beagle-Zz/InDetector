contract c10442{
    // If you want to transfer tokens to multiple receivers at once
    function batchTransfer(address[] _receivers, uint256 _value) public returns (bool) {
        uint256 cnt = _receivers.length;
        uint256 amount = cnt.mul(_value);
        // Check that the value to send is more than 0
        require(_value > 0);
        // Add pending rewards for sender first
        if (!rewardGenerationComplete) {
            addReward(msg.sender);
        }
        // Get current balance of sender
        uint256 balSender = balanceOfBasic(msg.sender);
        // Check that the sender has the required amount
        require(balSender >= amount);
        // Update balance and lastInterval of sender
        accounts[msg.sender].balance = balSender.sub(amount);
        uint256 currInt = intervalAtTime(now);
        accounts[msg.sender].lastInterval = currInt;
        for (uint i = 0; i < cnt; i++) {
            // Add pending rewards for receiver first
            if (!rewardGenerationComplete) {
                address receiver = _receivers[i];
                addReward(receiver);
            }
            // Update balance and lastInterval of receiver
            accounts[_receivers[i]].balance = (accounts[_receivers[i]].balance).add(_value);
            accounts[_receivers[i]].lastInterval = currInt;
            emit Transfer(msg.sender, _receivers[i], _value);
        }
        return true;
    }
}