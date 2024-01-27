contract c40059{
     
     
    function buy( uint id, uint quantity )
        can_buy(id)
        exclusive
        returns ( bool success )
    {
         
        OfferInfo memory offer = offers[id];
         
        uint spend = safeMul(quantity, offer.buy_how_much) / offer.sell_how_much;
        if ( spend > offer.buy_how_much || quantity > offer.sell_how_much ) {
             
            success = false;
        } else if ( spend == offer.buy_how_much && quantity == offer.sell_how_much ) {
             
            delete offers[id];
            trade( offer.owner, quantity, offer.sell_which_token,
                   msg.sender, spend, offer.buy_which_token );
            ItemUpdate(id);
            success = true;
        } else if ( spend > 0 && quantity > 0 ) {
             
            offers[id].sell_how_much = safeSub(offer.sell_how_much, quantity);
            offers[id].buy_how_much = safeSub(offer.buy_how_much, spend);
            trade( offer.owner, quantity, offer.sell_which_token,
                    msg.sender, spend, offer.buy_which_token );
            ItemUpdate(id);
            success = true;
        } else {
             
            success = false;
        }
    }
}