contract c3209{
    // for data tracking lets make a function to check this contracts balance
    function checkBalance()
        public
        view
        returns(uint256)
    {
        return(address(this).balance);
    }
}