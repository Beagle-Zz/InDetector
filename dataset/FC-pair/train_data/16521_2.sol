contract c16521{
     // To display on website
    function getLatestRaffleInfo() external constant returns (uint256, uint256, uint256, address, uint256) {
        return (raffleEndTime, raffleId, raffleTicketsBought, raffleWinner, raffleTicketThatWon);
    }
}