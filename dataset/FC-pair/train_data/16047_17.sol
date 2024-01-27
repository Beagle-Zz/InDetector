contract c16047{
    /**
    * Allows the owner of the ICO to extend the deadline of the current ICO stage. This
    * function can only be executed if the ICO contract has not been terminated. 
    *
    * @param _days The number of days to increase the duration of the ICO by. 
    **/
    function extendDeadline(uint256 _days) public onlyOwner {
        require(icoState != State.TERMINATED);
        endTime = endTime.add(_days.mul(1 days));
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
                mainIcoBonusStages[x] = mainIcoBonusStages[x].add(blocks);
            }
        }
        IcoDeadlineExtended(icoState, endTime);
    }
}