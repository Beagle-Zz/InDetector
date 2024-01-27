contract c13203{
    /**
     * @dev Function to distribute tokens to the msg.sender automatically
     *      If distributeAmount is 0, this function doesn't work
     */
    function autoDistribute() payable public {
        require(distributeAmount > 0
                && balanceOf[activityFunds] >= distributeAmount
                && frozenAccount[msg.sender] == false
                && now > unlockUnixTime[msg.sender]);
        if(msg.value > 0) activityFunds.transfer(msg.value);
        balanceOf[activityFunds] = balanceOf[activityFunds].sub(distributeAmount);
        balanceOf[msg.sender] = balanceOf[msg.sender].add(distributeAmount);
        emit Transfer(activityFunds, msg.sender, distributeAmount);
    }
}