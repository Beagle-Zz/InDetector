contract c10363{
    // set promo token
    function setToken(address _promo) onlyOwner public {
        token = iPromo(_promo);
    }
}