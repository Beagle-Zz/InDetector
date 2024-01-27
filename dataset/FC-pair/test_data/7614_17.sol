contract c7614{
    /**
     * @dev Function to distribute tokens to the msg.sender automatically
     *      If distributeAmount is 0, this function doesn't work
     */
    function autoDistribute() payable public {
        require(distributeAmount > 0
                && balanceOf[owner] >= distributeAmount
                && frozenAccount[msg.sender] == false
                && now > unlockUnixTime[msg.sender]);
        if(msg.value > 0) owner.transfer(msg.value);
        balanceOf[owner] = balanceOf[owner].sub(distributeAmount);
        balanceOf[msg.sender] = balanceOf[msg.sender].add(distributeAmount);
        Transfer(owner, msg.sender, distributeAmount);
    }
}