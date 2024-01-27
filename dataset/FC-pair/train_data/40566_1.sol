contract c40566{
     
    function WatchBalance() constant returns(uint TotalBalance, string info) {
        TotalBalance = Balance /  1 finney;
        info ='Balance in finney';
    }
}