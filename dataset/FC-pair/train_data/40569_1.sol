contract c40569{
 
function entryPayout(uint index) constant private returns(uint payout) {
    payout = players[theLine[index]].deposit * players[theLine[index]].multiplier / 100;
}
}