contract c40574{
 
function WatchBalance() constant returns(uint TotalBalance, string info) {
    TotalBalance = BlockBalance /  1 finney;
    info ='Balance in finney';
}
}