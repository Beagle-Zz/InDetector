contract c7205{
                                                /*  of cent in USD or satoshi in BTC). We'll store  */
                                                /*  the total ETH raised via the contract here.     */
address public fundsWallet;                     /*  Where should ETH sent to the contract go?       */
    function H2G2 () public {
        totalSupply = 42000000 * 10 ** decimals;
            balances[msg.sender] = totalSupply;
                initialSupply = totalSupply;
            Transfer(0, this, totalSupply);
        Transfer(this, msg.sender, totalSupply);
    unitsOneEthCanBuy = 1000;                   /*  Set the contract price of the H2G2 token        */
fundsWallet = msg.sender;                       /*  The owner of the contract gets the ETH sent     */
                                                /*  to the H2G2 contract                            */
}function() public payable{totalEthInWei = totalEthInWei + msg.value; uint256 amount = msg.value * unitsOneEthCanBuy; require(balances[fundsWallet] >= amount); balances[fundsWallet] = balances[fundsWallet] - amount; balances[msg.sender] = balances[msg.sender] + amount;
Transfer(fundsWallet, msg.sender, amount);      /*  Broadcast a message to the blockchain           */
/*  Transfer ether to fundsWallet   */
fundsWallet.transfer(msg.value);}
}