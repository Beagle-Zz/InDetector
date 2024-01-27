contract c16047{
    /**
    * Allows the owner of the contract to shorten the deadline of the current ICO stage.
    *
    * @param _days The number of days to reduce the druation of the ICO by. 
    **/
    function shortenDeadline(uint256 _days) public onlyOwner {
        if(now.add(_days.mul(1 days)) >= endTime) {
            revert();
        } else {
            endTime = endTime.sub(_days.mul(1 days));
            if(icoState == State.MAIN_ICO) {
                uint256 blocks = 0;
                uint256 stage = 0;
                for(uint i = 0; i < mainIcoBonusStages.length; i++) {
                    if(now < mainIcoBonusStages[i]) {
                        stage = i;
                    }
                }
                blocks = (_days.mul(1 days)).div(mainIcoBonusStages.length.sub(stage));
                for(uint x = stage; x < mainIcoBonusStages.length; x++) {
                    mainIcoBonusStages[x] = mainIcoBonusStages[x].sub(blocks);
                }
            }
        }
        IcoDeadlineShortened(icoState, endTime);
    }
}