contract c4525{
    // ~~~~~ Public Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    function transfer(address _to, uint _value) public returns (bool) {
        require(super.transfer(_to, _value));
        _rewardVote(msg.sender, _to, _value);
        return true;
    }
}