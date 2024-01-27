contract c14153{
    // withdraws from the reward pot
    function withdraw() external onlyWhitelisted {
        msg.sender.transfer(balance_);
        emit Withdrawn(msg.sender, balance_);
        balance_ = 0;
    }
}