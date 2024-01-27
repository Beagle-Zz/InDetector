contract c18756{
    // function called from MoatFund.sol
    function transferToken() public payable {
        if (msg.sender != owner &&
            msg.sender != tokenAddress &&
            msg.sender != boardAddress) {
                require(mintBool);
                require(msg.value >= minInvest);
                uint256 MTCToken = (msg.value / mtcRate);
                uint256 teamToken = (MTCToken / 20);
                ethRaised += msg.value;
                token tokenTransfer = token(tokenAddress);
                tokenTransfer.transfer(msg.sender, MTCToken);
                tokenTransfer.transfer(teamAddress, teamToken);
        }
    }
}