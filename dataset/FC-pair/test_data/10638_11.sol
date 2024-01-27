contract c10638{
    /**
     * @dev Reward the winner
     */
    function rewardTheWinner(uint8 reward) private {
        uint256 rewardValue = Math.percent(bank, reward);
        require(rewardValue <= getBalance());
        require(rewardValue <= bank);
        bank = Math.sub(bank, rewardValue);
        msg.sender.transfer(rewardValue);
        emit WeHaveAWinner(msg.sender, rewardValue);
    }
}