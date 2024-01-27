contract c3278{
    //get the total balance of this contract
    function getTotalBalance()
        public
        constant returns (uint)
    {
        return address(this).balance;
    }
}