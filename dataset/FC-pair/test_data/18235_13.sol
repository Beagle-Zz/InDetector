contract c18235{
    // To allow clients to verify contestants
    function getPlayersItemTickets(address player) external constant returns (uint256[], uint256[]) {
        TicketPurchases storage playersTickets = rareItemTicketsBoughtByPlayer[player];
        if (playersTickets.raffleId == itemRaffleRareId) {
            uint256[] memory startIds = new uint256[](playersTickets.numPurchases);
            uint256[] memory endIds = new uint256[](playersTickets.numPurchases);
            for (uint256 i = 0; i < playersTickets.numPurchases; i++) {
                startIds[i] = playersTickets.ticketsBought[i].startId;
                endIds[i] = playersTickets.ticketsBought[i].endId;
            }
        }
        return (startIds, endIds);
    }
}