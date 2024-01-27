contract c18235{
    // To allow clients to verify contestants
    function getItemRafflePlayers(uint256 raffleId) external constant returns (address[]) {
        return (itemRafflePlayers[raffleId]);
    }
}