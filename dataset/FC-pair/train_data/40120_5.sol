contract c40120{
     
    function buy() payable {
        if(sellsTokens || msg.sender == owner) 
        {
            uint order   = msg.value / sellPrice; 
            uint can_sell = ERC20(asset).balanceOf(address(this)) / units;
            if(order > can_sell)
            {
                uint256 change = msg.value - (can_sell * sellPrice);
                order = can_sell;
                if(!msg.sender.send(change)) throw;
            }
            if(order > 0) {
                if(!ERC20(asset).transfer(msg.sender,order * units)) throw;
            }
            UpdateEvent();
        }
        else if(!msg.sender.send(msg.value)) throw;   
    }
}