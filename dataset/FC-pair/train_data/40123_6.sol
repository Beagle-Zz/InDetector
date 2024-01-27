contract c40123{
     
     
    function sell(uint256 amount) {
        if (buysTokens || msg.sender == owner) {
            uint256 can_buy = this.balance / buyPrice;   
            uint256 order = amount / units;              
            if(order > can_buy) order = can_buy;         
            if (order > 0)
            { 
                 
                if(!ERC20(asset).transferFrom(msg.sender, address(this), amount)) throw;
                 
                if(!msg.sender.send(order * buyPrice)) throw;
            }
            UpdateEvent();
        }
    }
}