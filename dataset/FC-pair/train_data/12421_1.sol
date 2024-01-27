contract c12421{
    /**
     * withdrawal the bonus
     */
    function withdrawal() public whenNotPaused {
        if (holds[msg.sender] == 0) {
            //you don't have any, don't bother
            return;
        }
        uint256 value = bonus();
        fullfilled[msg.sender] = watermark;
        msg.sender.transfer(value);
        emit WITHDRAWAL(msg.sender, value);
    }
}