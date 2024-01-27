contract c8911{
    /// @dev Issue unsold token to `target` address.
    /// The math is as follows:
    ///   +-------------------------------------------------------------+
    ///   |       Total Ethers Received        |                        |
    ///   +------------------------------------+  Unsold Token Portion  |
    ///   |   Lower Bound   |   Upper Bound    |                        |
    ///   +-------------------------------------------------------------+
    ///   |      50,000     |     60,000       |         67.5%          |
    ///   +-------------------------------------------------------------+
    ///   |      60,000     |     70,000       |         65.0%          |
    ///   +-------------------------------------------------------------+
    ///   |      70,000     |     80,000       |         62.5%          |
    ///   +-------------------------------------------------------------+
    ///   |      80,000     |     90,000       |         60.0%          |
    ///   +-------------------------------------------------------------+
    ///   |      90,000     |    100,000       |         57.5%          |
    ///   +-------------------------------------------------------------+
    ///   |     100,000     |    110,000       |         55.0%          |
    ///   +-------------------------------------------------------------+
    ///   |     110,000     |    120,000       |         52.5%          |
    ///   +-------------------------------------------------------------+
    ///   |     120,000     |                  |         50.0%          |
    ///   +-------------------------------------------------------------+
    function issueUnsoldToken() internal {
        if (unsoldTokenIssued) {
            InvalidState("Unsold token has been issued already");
        } else {
            // Add another safe guard 
            require(totalEthReceived >= GOAL);
            uint level = totalEthReceived.sub(GOAL).div(10000 ether);
            if (level > 7) {
                level = 7;
            }
            uint unsoldRatioInThousand = MAX_UNSOLD_RATIO - 25 * level;
            // Calculate the `unsoldToken` to be issued, the amount of `unsoldToken`
            // is based on the issued amount, that is the `totalSupply`, during 
            // the sale:
            //                   totalSupply
            //   unsoldToken = --------------- * r
            //                      1 - r
            uint unsoldToken = totalSupply.div(1000 - unsoldRatioInThousand).mul(unsoldRatioInThousand);
            // Adjust `totalSupply`.
            totalSupply = totalSupply.add(unsoldToken);
            // Issue `unsoldToken` to the target account.
            balances[target] = balances[target].add(unsoldToken);
            Issue(
                issueIndex++,
                target,
                0,
                unsoldToken
            );
            unsoldTokenIssued = true;
        }
    }
}