contract c18235{
    // To allow clients to verify contestants
    function getUnitRafflePlayers(uint256 raffleId) external constant returns (address[]) {
        return (unitRafflePlayers[raffleId]);
    }
}