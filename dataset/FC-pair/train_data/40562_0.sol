contract c40562{
     
    function LookAtBalance() constant returns(uint BalanceOfZone1,uint BalanceOfZone2,uint BalanceOfZone3, string info) {
        BalanceOfZone1 = Balance[0] /  1 finney;
        BalanceOfZone2 = Balance[1] /  1 finney;
        BalanceOfZone3 = Balance[2] /  1 finney;
        info ='Balances of all play zones in finney';
    }
}