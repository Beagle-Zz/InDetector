contract c16521{
     // To allow clients to verify contestants
    function getPlayersTickets(address player) external constant returns (uint256[], uint256[]) {
        TicketPurchases storage playersTickets = ticketsBoughtByPlayer[player];
        if (playersTickets.raffleId == raffleId) {
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