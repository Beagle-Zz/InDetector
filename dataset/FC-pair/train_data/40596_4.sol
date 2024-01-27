contract c40596{
 
function NextPayout() constant returns(uint NextPayout) {
    NextPayout = players[Payout_id].payout /  1 wei;
}
}