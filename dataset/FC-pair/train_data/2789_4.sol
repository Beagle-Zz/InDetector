contract c2789{
    /**
     * @dev Award by rndNo.
     * 0x80ec35ff
     * 0x80ec35ff0000000000000000000000000000000000000000000000000000000000000001
     */
    function awardByRndNo(uint256 _rndNo)
        onlyHuman()
        public
    {
        require(_rndNo <= rndNo, "You're running too fast");
        require(now > round_m[_rndNo].endTime, "Wait patiently");
        require(round_m[_rndNo].leader == msg.sender, "The prize is not yours");
        require(round_m[_rndNo].award == false, "Can't get prizes repeatedly");
        uint256 _ethOut = ((round_m[_rndNo].eth).mul(35) / (100));
        round_m[_rndNo].award = true;
        msg.sender.transfer(_ethOut);
        // event
        emit FlyToTheMoonEvents.onAward
        (
            msg.sender,
            _rndNo,
            _ethOut,
            now
        );
    }
}