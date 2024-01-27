contract c10363{
    // transfer ownership of token
    function passToken(address _promo) onlyOwner public {
        require(_promo != address(0));
        require(address(token) != address(0));
        token.transferOwnership(_promo);
    }
}