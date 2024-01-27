contract c12761{
    /**
    * @dev Mints new TDP token and rewards to caller as per the coin age.
    *      Deletes all previous coinage records and resets with new coin age record.
    */
    function mint() public whenNotPaused canMint returns (bool) {
        if (balances[msg.sender] <= 0) {
            return false;
        }
        if (coinAgeRecordMap[msg.sender].length <= 0) {
            return false;
        }
        uint256 reward = calculateRewardInternal(msg.sender, now);                                          // solium-disable-line
        if (reward <= 0) {
            return false;
        }
        if (reward > MAX_TOTAL_SUPPLY.sub(totalSupply_)) {
            reward = MAX_TOTAL_SUPPLY.sub(totalSupply_);
        }
        totalSupply_ = totalSupply_.add(reward);
        balances[msg.sender] = balances[msg.sender].add(reward);
        emit Mint(msg.sender, reward);
        emit Transfer(address(0), msg.sender, reward);
        uint64 _now = uint64(now);                                                                          // solium-disable-line
        delete coinAgeRecordMap[msg.sender];
        coinAgeRecordMap[msg.sender].push(CoinAgeRecord(balances[msg.sender], _now));
        emit CoinAgeResetEvent(msg.sender, balances[msg.sender], _now);
        return true;
    }
}