contract c10267{
    ///@notice set jackpotComplete to true and transfer 20 percent share of jackpot to owner
    function setJackpotCompleted() public onlyOwner{
        jackpotCompleted = true;
        finalJackpotValue = address(this).balance;
        uint256 jackpotShare = ((address(this).balance).mul(20)).div(100);
        msg.sender.transfer(jackpotShare);
    }
}