contract c3378{
    // This function returns the current important stats of the game such as the timer, current balance and current winner, the current press prices...
    function GetCurrentNumbers() public view returns(uint, uint256, address, uint, uint256, uint256, uint256) {
        return(timerEnd, address(this).balance, winningAddress, countPresses, amountPlayed, getButtonPrice(), countInvestorDividends);
    }
}