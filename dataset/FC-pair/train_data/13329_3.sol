contract c13329{
    // Returns the name of the current round in plain text. Constant.
    function getTokenSaleType() external view returns(string){
        return (TokenSale == TokenSaleType.round1)?'round1':'round2';
    }
}