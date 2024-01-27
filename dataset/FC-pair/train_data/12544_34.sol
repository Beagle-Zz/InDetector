contract c12544{
    /**
     * Allows the owner to unpause the ICO.
     * */
    function unpauseICO() public onlyOwner {
        endTime = endTime.add(now.sub(timePaused));
        timePaused = 0;
        icoPaused = false;
        ICOUnpaused(now);
    }
}