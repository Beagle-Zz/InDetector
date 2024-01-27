contract c7419{
    // To allow clients to verify contestants
    function getRafflePlayers(uint256 raffle) external constant returns (address[]) {
        return (rafflePlayers[raffle]);
    }
}