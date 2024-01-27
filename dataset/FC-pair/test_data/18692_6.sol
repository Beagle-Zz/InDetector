contract c18692{
    // all contract calls are banned from buying 
    function Buy(uint8 ID, string Quote, string Name) public payable NoContract {
        require(ID < MaxItems);
        require(!EditMode);
        // get price 
        //uint8 pid = Market[ID].PriceID;
        uint256 price = GetPrice(Market[ID].PriceID);
        require(msg.value >= price);
        if (block.timestamp > Timer){
            if (Timer != 0){ // timer 0 means withdraw is gone; withdraw will throw on 0
                Withdraw("GameInit", "Admin");
                return;
            }
        }
        // return excess 
        if (msg.value > price){
            msg.sender.transfer(msg.value-price);
        }
        uint256 PayTax = (price * Tax)/10000;
        feesend.transfer(PayTax);
        uint256 Left = (price-PayTax);
        if (Market[ID].PriceID!=0){
            // unzero, move to previous owner
            uint256 pay = (Left*PreviousPayout)/10000;
            TotalPot = TotalPot + (Left-pay);
           // Left=Left-pay;
            Market[ID].Holder.transfer(pay);
        }
        else{
            TotalPot = TotalPot + Left;
        }
        // reset timer; 
        Timer = block.timestamp + GetTime(Market[ID].PriceID);
        //set jackpot winner 
        JackpotWinner = msg.sender;
        // give user new card; 
        emit ItemBought(RoundNumber,ID,  price,  Market[ID].Holder, msg.sender, Timer,  TotalPot,  Quote, Name);
        DrawAddr(); // give player cards
        // update price 
        Market[ID].PriceID++;
        //set holder 
        Market[ID].Holder=msg.sender;
    }
}