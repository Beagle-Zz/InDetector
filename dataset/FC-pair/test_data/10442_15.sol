contract c10442{
    // This function checks how many intervals for a given window do we owe tokens to someone for 
    function getIntervalsForWindow(uint256 rateWindow, uint256 lastInterval, uint256 currInterval, uint256 intPerWind) public pure returns (uint256) {
        // If lastInterval for holder falls in a window previous to current one, the lastInterval for the window passed into the function would be the window start interval
        if (lastInterval < ((rateWindow.sub(1)).mul(intPerWind))) {
            lastInterval = ((rateWindow.sub(1)).mul(intPerWind));
        }
        // If currentInterval for holder falls in a window higher than current one, the currentInterval for the window passed into the function would be the window end interval
        if (currInterval > rateWindow.mul(intPerWind)) {
            currInterval = rateWindow.mul(intPerWind);
        }
        return currInterval.sub(lastInterval);
    }
}