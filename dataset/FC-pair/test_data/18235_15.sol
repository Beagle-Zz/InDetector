contract c18235{
    // To display on website
    function getLatestItemRaffleInfo() external constant returns (uint256, uint256, uint256, address, uint256) {
        return (itemRaffleEndTime, itemRaffleRareId, itemRaffleTicketsBought, itemRaffleWinner, itemRaffleTicketThatWon);
    }
}