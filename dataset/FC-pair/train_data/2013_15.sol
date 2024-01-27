contract c2013{
    /// @notice Performs the computation of auction winners and losers.
    /// Also, determines if the auction is successful or failed.
    /// Bids which place the asset valuation below the minimum fundraise cap
    /// as well as bids below the final valuation are marked as ignored or "loser" respectively
    /// and do not count towards the process.
    /// @dev Since this function is resource intensive, computation is done in batches
    /// of `_count` bids, so as to not encounter an OutOfGas exception in the middle
    /// of the process.
    /// @param _count Amount of bids to be processed in this run.
    function computeBids(uint _count) public onlyOwner{
        require(status == state.decrypted);
        require(_count > 0);
        uint count = _count;
        // No bids
        if (bids_sorted_count == 0){
            status = state.failure;
            emit Failure(0, 0);
            return;
        }
        //bids_computed_cursor: How many bid already processed
        //bids_sorted_count: How many bids can compunte
        require(bids_computed_cursor < bids_sorted_count);
        //bid: Auxiliary variable
        BidData memory bid;
        do{
            //bid: Current bid to compute
            bid = bids_sorted[bids_computed_cursor];
            //if only one share of current bid leave us out of fundraise limitis, ignore the bid
            //computed_shares_sold: Sumarize shares sold
            if (bid.share_price.mul(computed_shares_sold).add(bid.share_price) > fundraise_max){
                if(bids_computed_cursor > 0){
                    bids_computed_cursor--;
                }
                bid = bids_sorted[bids_computed_cursor];
                break;
            }
            //computed_shares_sold: Sumarize cumpued shares
            computed_shares_sold = computed_shares_sold.add(bid.shares_count);
            //computed_fundraise: Sumarize fundraise
            computed_fundraise = bid.share_price.mul(computed_shares_sold);
            emit Computed(bid.origin_index, bid.share_price, bid.shares_count);
            //Next bid
            bids_computed_cursor++;
            count--;
        }while(
            count > 0 && //We have limite to compute
            bids_computed_cursor < bids_sorted_count && //We have more bids to compute 
            (
                computed_fundraise < fundraise_max && //Fundraise is more or equal to max
                computed_shares_sold < max_shares_to_sell //Assigned shares are more or equal to max
            )
        );
        if (
            bids_computed_cursor == bids_sorted_count ||  //All bids computed
            computed_fundraise >= fundraise_max ||//Fundraise is more or equal to max
            computed_shares_sold >= max_shares_to_sell//Max shares raised
        ){
            final_share_price = bid.share_price;
            //More than max shares
            if(computed_shares_sold >= max_shares_to_sell){
                computed_shares_sold = max_shares_to_sell;//Limit shares
                computed_fundraise = final_share_price.mul(computed_shares_sold);
                winner_bids = bids_computed_cursor;
                status = state.success;
                emit Success(computed_fundraise, final_share_price, computed_shares_sold);
                return;            
            }
            //Max fundraise is raised
            if(computed_fundraise.add(final_share_price.mul(1)) >= fundraise_max){//More than max fundraise
                computed_fundraise = fundraise_max;//Limit fundraise
                winner_bids = bids_computed_cursor;
                status = state.success;
                emit Success(computed_fundraise, final_share_price, computed_shares_sold);
                return;
            }
            //All bids computed
            if (bids_computed_cursor == bids_sorted_count){
                if (computed_shares_sold >= min_shares_to_sell){
                    winner_bids = bids_computed_cursor;
                    status = state.success;
                    emit Success(computed_fundraise, final_share_price, computed_shares_sold);
                    return;
                }else{
                    status = state.failure;
                    emit Failure(computed_fundraise, final_share_price);
                    return;
                }
            }
        }
    }
}