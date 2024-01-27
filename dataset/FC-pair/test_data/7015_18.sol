contract c7015{
    //buy and sell execute live trades against the exchanger. For either method, 
    //you must specify your minimum return (in total tokens or ether that you expect to receive for your trade)
    //this protects the trader against slippage due to other orders that make it into earlier blocks after they 
    //place their order. 
    //
    //With buy, send the amount of ether you want to spend on the token - you'll get it back immediately if minPurchaseReturn
    //is not met or if this Exchanger is not in a condition to service your order (usually this happens when there is not a full 
    //reserve of tokens to satisfy the stated weight)
    //
    //With sell, first approve the exchanger to spend the number of tokens you want to sell
    //Then call sell with that number and your minSaleReturn. The token transfer will not happen 
    //if the minSaleReturn is not met.
    //
    //Sales always go through, as long as there is any ether in the reserve... but those dumping massive quantities of tokens
    //will naturally be given the shittest rates.
    /**
     @dev Buy tokens with ether. 
     @param minPurchaseReturn The minimum number of tokens you will accept.
     */
    function buy(uint minPurchaseReturn) public payable {
        uint amount = formulaContract.calculatePurchaseReturn(
            (tokenContract.totalSupply() - uncirculatedSupplyCount) - tokenContract.balanceOf(this),
            (address(this).balance + virtualReserveBalance) - msg.value,
            weight,
            msg.value);
        amount = (amount - ((amount * fee) / 1000000));
        //Now do the trade if conditions are met
        require (enabled); // ADDED SEMICOLON    
        require (amount >= minPurchaseReturn);
        require (tokenContract.balanceOf(this) >= amount);
        //Accounting - so we can pull the fees out without changing the balance
        collectedFees += (msg.value * fee) / 1000000;
        emit Buy(msg.sender, msg.value, amount);
        tokenContract.transfer(msg.sender, amount);
    }
}