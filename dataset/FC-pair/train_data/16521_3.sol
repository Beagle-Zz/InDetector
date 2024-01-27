contract c16521{
    // To allow clients to verify contestants
    function getRafflePlayers(uint256 raffle) external constant returns (address[]) {
        return (rafflePlayers[raffle]);
    }
}